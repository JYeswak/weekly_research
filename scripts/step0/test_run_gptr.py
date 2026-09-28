#!/usr/bin/env python3
import ast, pathlib, unittest
from unittest.mock import patch
import run_gptr as r
class Handoff(unittest.TestCase):
 def test_all_roles_local(self):
  c=r.config('actual-model');self.assertEqual([c[k] for k in ('FAST_LLM','SMART_LLM','STRATEGIC_LLM')],['ollama:actual-model']*3)
 def test_no_embedding_or_image_provider(self):
  c=r.config('m');self.assertEqual(c['CONTEXT_FILTER'],'none');self.assertFalse(c['IMAGE_GENERATION_ENABLED']);self.assertEqual(c['MCP_STRATEGY'],'disabled')
 def test_honest_agent(self):self.assertNotIn('Mozilla',r.config('m')['USER_AGENT'])
 def test_wrong_pin_blocks(self):
  with patch.object(r.subprocess,'check_output',side_effect=['b'*40,'']),patch.object(r.importlib.util,'find_spec',return_value=object()):
   self.assertIn('checkout does not match required pin',r.check(pathlib.Path('.'),'m',False)['errors'])
 def test_modified_checkout_blocks(self):
  with patch.object(r.subprocess,'check_output',side_effect=[r.PIN,' M tracked.py']),patch.object(r.importlib.util,'find_spec',return_value=object()):
   self.assertIn('tracked candidate source is modified',r.check(pathlib.Path('.'),'m',False)['errors'])
 def test_placeholder_blocks(self):
  with patch.object(r.subprocess,'check_output',side_effect=[r.PIN,'']),patch.object(r.importlib.util,'find_spec',return_value=object()):
   self.assertIn('select an actual installed Ollama model',r.check(pathlib.Path('.'),'<model>',False)['errors'])
 def test_missing_dependencies(self):
  with patch.object(r.subprocess,'check_output',side_effect=[r.PIN,'']),patch.object(r.importlib.util,'find_spec',return_value=None):
   self.assertEqual(len(r.check(pathlib.Path('.'),'m',False)['errors']),3)
if __name__=='__main__':unittest.main(verbosity=2)
