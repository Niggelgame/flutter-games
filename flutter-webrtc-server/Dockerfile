FROM golang:1.17-alpine as builder

WORKDIR /app

RUN apk add --no-cache build-base

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN CGO_ENABLED=1 GOOS=linux go build cmd/server/main.go

FROM alpine

RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=builder /app/main .
CMD ["/root/main"]