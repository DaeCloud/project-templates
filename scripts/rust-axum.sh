#!/usr/bin/env bash
set -e
if [ -z "$1" ]; then echo "Usage: $0 <project-name>"; exit 1; fi
PROJECT="$1"; mkdir $PROJECT; cd $PROJECT
cat <<'EOF' > Cargo.toml
[package]
name="rust_axum_app"
version="0.1.0"
edition="2021"
[dependencies]
axum="0.7"
tokio={version="1",features=["full"]}
EOF
cat <<'EOF' > main.rs
use axum::{routing::get,Json,Router};
async fn items()->Json<Vec<serde_json::Value>>{
    Json(vec![serde_json::json!({"id":1,"name":"Sample"})])
}
#[tokio::main]
async fn main(){
    let app=Router::new().route("/items",get(items));
    axum::Server::bind(&"0.0.0.0:3000".parse().unwrap()).serve(app.into_make_service()).await.unwrap();
}
EOF
cat <<'EOF' > Dockerfile
FROM rust:1.75
WORKDIR /app
COPY . .
RUN cargo build --release
EXPOSE 3000
CMD ["./target/release/rust_axum_app"]
EOF
