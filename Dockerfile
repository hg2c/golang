FROM golang:alpine

RUN apk add --no-cache bash curl git glide govendor make
RUN go get -u github.com/golang/dep/cmd/dep
