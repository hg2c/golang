FROM golang:alpine
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime

RUN apk add --no-cache bash gcc curl git glide govendor make musl-dev librdkafka-dev parallel
RUN go get -u github.com/golang/dep/cmd/dep
RUN go get -u github.com/golang/lint/golint

RUN mkdir -p /go/src/k8s.io/kubernetes &&  \
 cd /go/src/k8s.io/kubernetes && \
 curl -o kubernetes.tar.gz -L https://github.com/kubernetes/kubernetes/archive/v1.8.12.tar.gz && \
 tar zxvf kubernetes.tar.gz  && \
 rm kubernetes.tar.gz
