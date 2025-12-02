#!/usr/bin/env bash
set -e
if [ -z "$1" ]; then echo "Usage: $0 <project-name>"; exit 1; fi
PROJECT="$1"
npx create-next-app@latest "$PROJECT" --ts --eslint --tailwind --app
cd "$PROJECT"
cat <<'EOF' > Dockerfile
FROM node:18
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD ["npm","run","dev"]
EOF
