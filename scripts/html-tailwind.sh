#!/usr/bin/env bash
set -e
if [ -z "$1" ]; then echo "Usage: $0 <project-name>"; exit 1; fi
PROJECT="$1"; mkdir $PROJECT; cd $PROJECT
npm init -y >/dev/null
npm install -D tailwindcss >/dev/null
npx tailwindcss init
cat <<'EOF' > index.html
<!DOCTYPE html><html><head><script src="https://cdn.tailwindcss.com"></script></head>
<body class="p-10"><h1 class="text-3xl font-bold">Hello Tailwind</h1></body></html>
EOF
cat <<'EOF' > Dockerfile
FROM node:18
WORKDIR /app
COPY . .
RUN npm install
EXPOSE 8080
CMD ["npx","http-server",".","-p","8080"]
EOF
