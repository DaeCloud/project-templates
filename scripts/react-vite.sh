#!/usr/bin/env bash
set -e
if [ -z "$1" ]; then echo "Usage: $0 <project-name>"; exit 1; fi
npm create vite@latest "$1" -- --template react
cd "$1"
npm install
cat <<'EOF' > Dockerfile
FROM node:18
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 5173
CMD ["npm","run","dev","--","--host"]
EOF
