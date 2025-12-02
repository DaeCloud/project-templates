#!/usr/bin/env bash
set -e
if [ -z "$1" ]; then echo "Usage: $0 <project-name>"; exit 1; fi
PROJECT="$1"; mkdir $PROJECT; cd $PROJECT
cat <<'EOF' > Cargo.toml
[package]
name="rust_actix_app"
version="0.1.0"
edition="2021"
[dependencies]
actix-web="4"
EOF
cat <<'EOF' > main.rs
use actix_web::{get,App,HttpServer,Responder};
#[get("/items")]
async fn items()->impl Responder{
    actix_web::web::Json(vec![serde_json::json!({"id":1,"name":"Sample"})])
}
#[actix_web::main]
async fn main()->std::io::Result<()>{
    HttpServer::new(||App::new().service(items)).bind(("0.0.0.0",3000))?.run().await
}
EOF
cat <<'EOF' > Dockerfile
FROM rust:1.75
WORKDIR /app
COPY . .
RUN cargo build --release
EXPOSE 3000
CMD ["./target/release/rust_actix_app"]
EOF
