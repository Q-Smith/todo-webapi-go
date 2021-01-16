FROM golang:1.15 AS stage_build
WORKDIR /src/
COPY . /src/
ENV GOOS=linux
ENV GOARCH=amd64
ENV CGO_ENABLED=0
RUN go mod download
RUN go test -v
RUN go build -o /dist/todoapi

FROM alpine:3.13 AS stage_final
RUN apk --no-cache add ca-certificates
WORKDIR /app/
COPY --from=stage_build /dist/todoapi .
EXPOSE 8080
CMD ["/app/todoapi"]  