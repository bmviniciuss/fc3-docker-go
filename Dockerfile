FROM golang:1.22.0-alpine as builder

WORKDIR /app

COPY . .

RUN go mod download
RUN go build -o bin/main

FROM scratch as runner
WORKDIR /app
COPY --from=builder /app/bin/main /app/main

CMD ["/app/main"]
