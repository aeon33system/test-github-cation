# 使用官方 Python 鏡像
FROM python:3.9-slim

# 設定工作目錄
WORKDIR /app

# 複製依賴清單並安裝 (這是測試通過的前提)
COPY . .
RUN pip install --no-cache-dir -r requirements.txt

# 強制執行單元測試
RUN python -m unittest test_app.py

# 設定埠號與啟動命令
EXPOSE 5000
CMD ["python", "app.py"]