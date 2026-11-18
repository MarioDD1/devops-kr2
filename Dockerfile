FROM python:3.12-slim

RUN useradd --system --uid 10001 --user-group --no-create-home app
WORKDIR /app

COPY --chmod=644 requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY --chmod=644 app.py .

USER app
EXPOSE 8003
CMD ["gunicorn", "--bind", "0.0.0.0:8003", "--access-logfile", "-", "app:app"]
