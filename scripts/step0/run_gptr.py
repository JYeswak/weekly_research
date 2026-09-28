#!/usr/bin/env python3
"""Pinned GPT Researcher handoff. Default is read-only preflight; --run opts into local-model work.
No model downloads or paid-provider calls are performed by this wrapper.
"""
import argparse, asyncio, hashlib, importlib.util, json, os, pathlib, signal, subprocess, sys, time, urllib.request
PIN='0957c301ed06c2a5857b834358c7227c739041d4'
BASE='http://127.0.0.1:11434'
def dump(p,x):p.write_text(json.dumps(x,indent=2,default=str)+'\n')
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def config(model):
    return {'FAST_LLM':'ollama:'+model,'SMART_LLM':'ollama:'+model,'STRATEGIC_LLM':'ollama:'+model,
      'RETRIEVER':'duckduckgo','CONTEXT_FILTER':'none','CURATE_SOURCES':False,'IMAGE_GENERATION_ENABLED':False,
      'USER_AGENT':'weekly_research-step0/0.1 (+https://github.com/JYeswak/weekly_research)',
      'FAST_TOKEN_LIMIT':1500,'SMART_TOKEN_LIMIT':2500,'STRATEGIC_TOKEN_LIMIT':1500,
      'MAX_ITERATIONS':1,'MAX_SEARCH_RESULTS_PER_QUERY':3,'MAX_SUBTOPICS':1,'MAX_SCRAPER_WORKERS':2,
      'TOTAL_WORDS':600,'MCP_STRATEGY':'disabled','REPORT_SOURCE':'web','VERBOSE':False}
def check(repo,model,check_server=True):
    errors=[]; details={'pin':PIN,'model':model,'endpoint':BASE,'scope':'preflight, not research quality'}
    try:
        head=subprocess.check_output(['git','rev-parse','HEAD'],cwd=repo,text=True).strip()
        details['checkout']=head
        if head!=PIN:errors.append('checkout does not match required pin')
        dirty=subprocess.check_output(['git','status','--porcelain','--untracked-files=no'],cwd=repo,text=True)
        if dirty.strip():errors.append('tracked candidate source is modified')
    except (OSError,subprocess.SubprocessError):errors.append('candidate checkout unavailable')
    for name in ('gpt_researcher','langchain_ollama','ddgs'):
        if importlib.util.find_spec(name) is None:errors.append('missing installed package: '+name)
    if not model or '<' in model or '>' in model:errors.append('select an actual installed Ollama model')
    if check_server:
        try:
            with urllib.request.urlopen(BASE+'/api/tags',timeout=3) as r:data=json.load(r)
            models=data.get('models',[])
            matched=[m for m in models if model in (m.get('name'),m.get('model'))]
            if not matched:errors.append('selected model is not in local Ollama /api/tags')
            else:details['model_digest']=matched[0].get('digest')
        except (OSError,ValueError):errors.append('local Ollama server unavailable')
    details.update(status='BLOCKED' if errors else 'READY_FOR_LOCAL_RUN',errors=errors)
    return details
async def research(a,out):
    from gpt_researcher import GPTResearcher
    import gpt_researcher
    actual=pathlib.Path(gpt_researcher.__file__).resolve()
    expected=(a.repo/'gpt_researcher/__init__.py').resolve()
    if actual!=expected:raise RuntimeError('install candidate editable at the pinned checkout; imported source differs')
    cfg=json.loads((out/'config.json').read_text())
    researcher=GPTResearcher(query=(out/'query.txt').read_text(),report_type='research_report',
       config_path=str(out/'config.json'),source_urls=a.source_url or None,complement_source_urls=False,verbose=False)
    for key,value in cfg.items():
        if getattr(researcher.cfg,key.lower())!=value:raise RuntimeError('effective config mismatch: '+key)
    context=await researcher.conduct_research()
    if not context:raise RuntimeError('empty research context; refusing report from memory')
    report=await researcher.write_report()
    if not isinstance(report,str) or not report.strip():raise RuntimeError('empty report')
    (out/'report.md').write_text(report)
    dump(out/'sources.json',researcher.get_research_sources())
    dump(out/'source-urls.json',researcher.get_source_urls())
    dump(out/'context.json',researcher.get_research_context())
    dump(out/'usage.json',{'reported_cost_usd':researcher.get_costs(),'step_costs':researcher.get_step_costs(),
       'note':'library accounting is not an invoice; local compute, tokens and human review may be unmeasured','tokens':None,'human_review_minutes':None})
    if not researcher.get_source_urls():raise RuntimeError('report exists but no recoverable source URLs; do not admit as cited research')
def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--repo',type=pathlib.Path,required=True);p.add_argument('--model',required=True)
    p.add_argument('--query-file',type=pathlib.Path);p.add_argument('--output',type=pathlib.Path);p.add_argument('--source-url',action='append',default=[])
    p.add_argument('--timeout-seconds',type=int,default=600);p.add_argument('--run',action='store_true');p.add_argument('--worker',action='store_true',help=argparse.SUPPRESS)
    a=p.parse_args();a.repo=a.repo.resolve()
    if a.worker:
        try:asyncio.run(research(a,a.output.resolve()));return 0
        except Exception as e:print(type(e).__name__+': '+str(e),file=sys.stderr);return 1
    result=check(a.repo,a.model);print(json.dumps(result,indent=2))
    if not a.run:return 0 if not result['errors'] else 2
    if result['errors']:return 2
    if not a.query_file or not a.query_file.is_file() or not a.output:p.error('--run requires existing --query-file and --output')
    if not 1<=a.timeout_seconds<=3600:p.error('timeout must be 1..3600 seconds')
    out=a.output.resolve()
    if out.exists():p.error('output must be new; never overwrite evidence')
    out.mkdir(parents=True,mode=0o700)
    (out/'query.txt').write_bytes(a.query_file.read_bytes());dump(out/'preflight.json',result);cfg=config(a.model);dump(out/'config.json',cfg)
    # Fixed experiment config wins over ambient provider settings; run in an empty private directory.
    env={k:v for k,v in os.environ.items() if k not in cfg and not k.endswith(('_API_KEY','_TOKEN')) and not k.startswith(('LANGCHAIN_','LANGSMITH_','MONOCLE_','OTEL_','OPENAI_','OLLAMA_','LLM_','EMBEDDING_','MCP_'))}
    env.update({k:json.dumps(v) if not isinstance(v,str) else v for k,v in cfg.items()})
    env.update(OLLAMA_BASE_URL=BASE,LANGCHAIN_TRACING_V2='false',PYTHONPATH=str(a.repo),PYTHONUNBUFFERED='1')
    cmd=[sys.executable,str(pathlib.Path(__file__).resolve()),'--worker','--repo',str(a.repo),'--model',a.model,'--output',str(out)]
    for url in a.source_url:cmd.extend(['--source-url',url])
    start=time.monotonic();status='completed';code=1
    with (out/'stdout.log').open('w') as stdout,(out/'stderr.log').open('w') as stderr:
        child=subprocess.Popen(cmd,cwd=out,env=env,stdout=stdout,stderr=stderr,start_new_session=True)
        try:code=child.wait(timeout=a.timeout_seconds)
        except subprocess.TimeoutExpired:
            status='timeout';os.killpg(child.pid,signal.SIGTERM)
            try:child.wait(timeout=5)
            except subprocess.TimeoutExpired:os.killpg(child.pid,signal.SIGKILL);child.wait()
            code=124
    dump(out/'receipt.json',{'command':cmd,'exit_code':code,'status':status if code==0 or code==124 else 'failed',
         'elapsed_seconds':time.monotonic()-start,'pin':PIN,'source_urls_requested':a.source_url,
         'scope':'actual candidate execution; no correctness certification; client timeout does not certify Ollama server cancellation'})
    dump(out/'manifest.json',{str(f.relative_to(out)):sha(f) for f in out.rglob('*') if f.is_file() and f.name!='manifest.json'})
    return code
if __name__=='__main__':sys.exit(main())
