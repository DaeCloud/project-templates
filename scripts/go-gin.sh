#!/usr/bin/env bash
set -e
if [ -z "$1" ]; then echo "Usage: $0 <project-name>"; exit 1; fi
PROJECT="$1"; mkdir $PROJECT; cd $PROJECT
go mod init $PROJECT
go get github.com/gin-gonic/gin
cat <<'EOF' > main.go
package main
import "github.com/gin-gonic/gin"
func main(){r:=gin.Default();r.GET("/items",func(c *gin.Context){c.JSON(200,[]gin.H{{"id":1,"name":"Sample"}})});r.Run(":8080")}
EOF
cat <<'EOF' > Dockerfile
FROM golang:1.21
WORKDIR /app
COPY . .
RUN go build -o app
EXPOSE 8080
CMD ["./app"]
EOF
