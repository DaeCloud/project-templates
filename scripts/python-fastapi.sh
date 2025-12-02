#!/usr/bin/env bash
set -e
if [ -z "$1" ]; then echo "Usage: $0 <project-name>"; exit 1; fi
PROJECT="$1"; mkdir "$PROJECT"; cd "$PROJECT"
python3 -m venv venv
source venv/bin/activate
pip install fastapi uvicorn
cat <<'EOF' > main.py
from fastapi import FastAPI
app=FastAPI()
@app.get("/items")
def get_items(): return [{"id":1,"name":"Sample"}]
EOF
cat <<'EOF' > Dockerfile
FROM python:3.11
WORKDIR /app
COPY . .
RUN pip install fastapi uvicorn
EXPOSE 8000
CMD ["uvicorn","main:app","--host","0.0.0.0","--port","8000"]
EOF
