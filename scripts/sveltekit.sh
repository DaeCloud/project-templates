#!/usr/bin/env bash
set -e
if [ -z "$1" ]; then echo "Usage: $0 <project-name>"; exit 1; fi
npm create svelte@latest "$1"
cd "$1"
npm install
cat <<'EOF' > Dockerfile
FROM node:18
WORKDIR /app
COPY . .
RUN npm install
EXPOSE 5173
CMD ["npm","run","dev","--","--host"]
EOF
