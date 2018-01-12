FROM golang:alpine

RUN apk add --no-cache bash curl git glide govendor make tzdata \
  && cp -r -f /usr/share/zoneinfo/Asia/Chongqing /etc/localtime

RUN go get -u github.com/golang/dep/cmd/dep
