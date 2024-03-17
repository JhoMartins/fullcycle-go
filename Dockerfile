FROM golang:1.22.1-alpine3.19 AS builder

WORKDIR /app

COPY . .

RUN go build -o bin/hello .

FROM scratch

WORKDIR /app

COPY --from=builder /app/bin .

CMD ["./hello"]

