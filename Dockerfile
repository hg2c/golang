FROM golang:alpine

RUN apk add --no-cache bash curl git glide godep govendor make
