FROM --platform=linux/amd64 python:3.10-slim
WORKDIR /app
COPY requirements.txt .
RUN apt-get update && apt-get install -y --no-install-recommends tesseract-ocr tesseract-ocr-jpn && rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir -r requirements.txt
# MiniLM weights (optional fallback for non‑font PDFs)
RUN python - <<'PY'
from huggingface_hub import snapshot_download
snapshot_download(repo_id="sentence-transformers/all-MiniLM-L6-v2",
                  local_dir="src/models/all-MiniLM-L6-v2",
                  revision="main",
                  cache_dir="/tmp/hf")
PY
COPY src/ src/
COPY main.py .
ENTRYPOINT ["python","/app/main.py"]
