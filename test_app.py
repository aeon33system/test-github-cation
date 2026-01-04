import unittest
from app import app

class LineBotTestCase(unittest.TestCase):
    def setUp(self):
        self.app = app.test_client()

    def test_health_check(self):
        response = self.app.get('/')
        self.assertEqual(response.status_code, 200)
        self.assertIn(b'line-bot-active', response.data)

    def test_callback_unauthorized(self):
        # 測試在沒有簽名的情況下，callback 應該回傳 400 或出錯
        response = self.app.post('/callback', data='{}')
        self.assertEqual(response.status_code, 400)

if __name__ == '__main__':
    unittest.main()