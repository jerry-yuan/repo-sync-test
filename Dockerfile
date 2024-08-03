FROM golang:alpine as builder

COPY main.go /tmp/main.go
RUN go build -o /tmp/hellogo /tmp/main.go

FROM alpine:latest
COPY --from=builder /tmp/hellogo /usr/bin/hellogo

RUN ["hellogo"]