FROM golang:1.8.1-alpine

WORKDIR /app
COPY main.go main.go
RUN go build main.go

FROM busybox:1.26.2

COPY --from=0 /app/main /bin/app

ENTRYPOINT ["app"]

