# Project Bootstrap Scripts
![License](https://img.shields.io/badge/license-MIT-green)
![Scripts](https://img.shields.io/badge/scripts-13-blue)
![Docker Ready](https://img.shields.io/badge/docker-ready-orange)
![Automation](https://img.shields.io/badge/automation-100%25-success)

A collection of lightweight shell scripts that instantly scaffold fully working web projects.
Each script installs dependencies, generates starter code, sets up a Dockerfile, and gives you a ready-to-run development environment within seconds.

Fetch a script, run it, and start building — no boilerplate, no repetition.

---

## ✨ Features

- One-command project creation
- Automatic dependency installation
- Pre-generated sample code (API routes, pages, etc.)
- Every template includes a production-ready Dockerfile
- No global installs required — scripts handle everything
- Works on macOS, Linux, WSL2, and inside Docker-based build systems

---

## 📦 Available Project Templates

Each script bootstraps a fully working project with sample code.

### **Node.js**
- `node-express.sh` – Express server with CRUD endpoints
- `node-next.sh` – Next.js (TypeScript + Tailwind)

### **Python**
- `python-fastapi.sh` – FastAPI app with example route
- `python-flask.sh` – Flask API
- `python-django.sh` – Base Django project

### **Go**
- `go-gin.sh` – Gin REST API
- `go-fiber.sh` – Fiber API project

### **Rust**
- `rust-axum.sh` – Axum API
- `rust-actix.sh` – Actix-Web API

### **PHP**
- `php-laravel.sh` – Laravel starter

### **Frontend**
- `react-vite.sh` – React + Vite
- `sveltekit.sh` – SvelteKit
- `html-tailwind.sh` – Barebones HTML + Tailwind

---

## 🚀 Usage

### **1. Download a script**
```bash
wget https://raw.githubusercontent.com/<your-username>/<repo>/main/node-express.sh
chmod +x node-express.sh
```

### **2. Generate a new project**
```bash
./node-express.sh my-api
```

This creates:
```
my-api/
  index.js
  package.json
  node_modules/
  Dockerfile
  ...
```

### **3. Run it**
```bash
docker build -t my-api .
docker run -p 3000:3000 my-api
```

---

## 📁 Repository Structure

```
/
├── node-express.sh
├── node-next.sh
├── python-fastapi.sh
├── python-flask.sh
├── python-django.sh
├── go-gin.sh
├── go-fiber.sh
├── rust-axum.sh
├── rust-actix.sh
├── php-laravel.sh
├── react-vite.sh
├── sveltekit.sh
└── html-tailwind.sh
```

---

## 📘 Why This Exists

Starting a new project shouldn't mean redoing the same setup steps for the 50th time.
These scripts guarantee consistent, reproducible, Docker-ready project scaffolding across backends, frontends, microservices, and quick experiments.

---

## 🤝 Contributing

PRs to improve scripts or add new templates are welcome.
Please keep scripts POSIX-compatible and minimal.

---

## 📄 License

MIT — free to use, modify, and adapt.
