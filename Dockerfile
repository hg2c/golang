FROM golang:alpine

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime

RUN apk add --no-cache bash gcc curl git glide govendor make musl-dev librdkafka-dev parallel

RUN mkdir -p /go/src/k8s.io/kubernetes &&  \
 cd /go/src/k8s.io/kubernetes && \
 curl -o kubernetes-release-1.3.tar.gz -L https://github.com/kubernetes/kubernetes/archive/v1.3.0.tar.gz && \
 tar zxvf kubernetes-release-1.3.tar.gz  && \
 rm kubernetes-release-1.3.tar.gz

RUN go get -u github.com/golang/dep/cmd/dep
RUN go get -u github.com/golang/lint/golint

RUN mkdir -p /data/src/
ENV GOPATH /data
RUN echo "export PATH=$PATH:$GOPATH/bin" >> /etc/profile
