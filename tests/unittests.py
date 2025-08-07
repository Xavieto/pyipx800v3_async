import unittest
import os
import sys

sys.path.append(os.path.dirname(os.path.realpath(__file__)) + "/../src")

from pyipx800v3_async.pyipx800v3_async import IPX800V3, Input, Analog, Output

class TestIPX800V3(unittest.IsolatedAsyncioTestCase):
    async def test_init(self):
        ipx = IPX800V3(host=os.getenv('IPX800_HOST'), username=os.getenv('IPX800_USER'), password=os.getenv('IPX800_PASS'))
        self.assertEqual(ipx.host, os.getenv('IPX800_HOST'))
        self.assertEqual(ipx._username, os.getenv('IPX800_USER'))
        self.assertEqual(ipx._password, os.getenv('IPX800_PASS'))
    
class TestAnalog(unittest.IsolatedAsyncioTestCase):
    async def test_init(self):
        ipx = IPX800V3(host=os.getenv('IPX800_HOST'), username=os.getenv('IPX800_USER'), password=os.getenv('IPX800_PASS'))
        an1 = Analog(ipx=ipx, id=1)
        self.assertEqual(an1.id, 1)