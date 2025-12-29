FROM python:3.15.0a3-slim

WORKDIR /app

COPY requirements.txt .


run pip install --no-cache-dir -r requirements.txt

COPY . .

RUN useradd -m -u 65532 appuser && chown -R appuser:appuser /app

USER appuser

EXPOSE 8000

CMD ["python", "app.py"]