FROM python:3.9-slim

WORKDIR /app

# 複製程式碼
# 先安裝套件
COPY . .
RUN pip install --no-cache-dir -r requirements.txt

# 執行測試。注意：測試時不需要真實的 LINE_CHANNEL_SECRET
# 因為我們的測試案例主要檢查 Flask 路由與環境啟動
RUN python -m unittest test_app.py

EXPOSE 5000

# 啟動應用
CMD ["python", "app.py"]