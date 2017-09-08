FROM golang:alpine

RUN apk add --no-cache bash curl git glide govendor make
