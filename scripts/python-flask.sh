#!/usr/bin/env bash
set -e
if [ -z "$1" ]; then echo "Usage: $0 <project-name>"; exit 1; fi
PROJECT="$1"; mkdir "$PROJECT"; cd "$PROJECT"
python3 -m venv venv
source venv/bin/activate
pip install flask
cat <<'EOF' > app.py
from flask import Flask, jsonify
app=Flask(__name__)
@app.get("/items")
def items(): return jsonify([{"id":1,"name":"Sample"}])
EOF
cat <<'EOF' > Dockerfile
FROM python:3.11
WORKDIR /app
COPY . .
RUN pip install flask
EXPOSE 5000
CMD ["python","app.py"]
EOF
