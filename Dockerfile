FROM python:3.9-slim

WORKDIR /app

# 複製程式碼
# 先安裝套件
COPY . .
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

# 啟動應用
CMD ["python", "app.py"]