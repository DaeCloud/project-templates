#!/usr/bin/env bash
set -e
if [ -z "$1" ]; then echo "Usage: $0 <project-name>"; exit 1; fi
PROJECT="$1"; mkdir "$PROJECT"; cd "$PROJECT"
npm init -y >/dev/null
npm install express cors >/dev/null
cat <<'EOF' > index.js
const express=require('express');const app=express();app.use(express.json());
let items=[{id:1,name:"Sample"}];
app.get('/api/items',(r,s)=>s.json(items));
app.get('/api/items/:id',(r,s)=>{const i=items.find(x=>x.id==r.params.id);i?s.json(i):s.status(404).json({error:"Not found"});});
app.post('/api/items',(r,s)=>{const it={id:Date.now(),...r.body};items.push(it);s.status(201).json(it);});
app.put('/api/items/:id',(r,s)=>{const i=items.findIndex(x=>x.id==r.params.id);if(i==-1)return s.status(404).json({error:"Not found"});items[i]={...items[i],...r.body};s.json(items[i]);});
app.delete('/api/items/:id',(r,s)=>{items=items.filter(x=>x.id!=r.params.id);s.status(204).end();});
app.listen(3000,()=>console.log("Running"));
EOF
cat <<'EOF' > Dockerfile
FROM node:18
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD ["node","index.js"]
EOF
echo "node_modules/" > .gitignore
