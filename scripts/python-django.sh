#!/usr/bin/env bash
set -e
if [ -z "$1" ]; then echo "Usage: $0 <project-name>"; exit 1; fi
PROJECT="$1"
pip install django >/dev/null
django-admin startproject $PROJECT
cd "$PROJECT"
cat <<'EOF' > Dockerfile
FROM python:3.11
WORKDIR /app
COPY . .
RUN pip install django
EXPOSE 8000
CMD ["python","manage.py","runserver","0.0.0.0:8000"]
EOF
