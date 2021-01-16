# Dependencies

go mod download

# Build

go build

# Test

go test

# Package

docker build -t todo-webapi .

# Run

docker run --rm -p 8080:8080 todo-webapi
