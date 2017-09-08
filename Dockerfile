FROM golang:alpine

RUN apk add --no-cache bash curl git glide govendor make librdkafka-dev

RUN mkdir -p /go/src/k8s.io/kubernetes &&  \
 cd /go/src/k8s.io/kubernetes && \
 curl -o kubernetes-release-1.3.tar.gz -L https://github.com/kubernetes/kubernetes/archive/v1.3.0.tar.gz && \
 tar zxvf kubernetes-release-1.3.tar.gz  && \
 rm kubernetes-release-1.3.tar.gz
