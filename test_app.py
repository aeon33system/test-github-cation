import unittest
from app import app

class LineBotTestCase(unittest.TestCase):
    def setUp(self):
        self.app = app.test_client()

    def test_health_check(self):
        response = self.app.get('/')
        self.assertEqual(response.status_code, 200)
        self.assertIn(b'line-bot-active', response.data)

if __name__ == '__main__':
    unittest.main()