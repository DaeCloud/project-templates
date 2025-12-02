#!/usr/bin/env bash
set -e
if [ -z "$1" ]; then echo "Usage: $0 <project-name>"; exit 1; fi
PROJECT="$1"; mkdir $PROJECT; cd $PROJECT
go mod init $PROJECT
go get github.com/gofiber/fiber/v2
cat <<'EOF' > main.go
package main
import "github.com/gofiber/fiber/v2"
func main(){app:=fiber.New();app.Get("/items",func(c *fiber.Ctx) error{return c.JSON([]map[string]any{{"id":1,"name":"Sample"}})});app.Listen(":8080")}
EOF
cat <<'EOF' > Dockerfile
FROM golang:1.21
WORKDIR /app
COPY . .
RUN go build -o app
EXPOSE 8080
CMD ["./app"]
EOF
