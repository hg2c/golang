FROM golang:alpine

RUN apk add --no-cache bash curl git glide govendor make librdkafka-dev

RUN apk add --no-cache g++ gcc musl-dev openssl-dev python

RUN cd /tmp && \
  git clone https://github.com/edenhill/librdkafka.git && \
  cd librdkafka && ./configure --prefix /usr && make && make install && \
  cd /go && rm -rf /tmp/librdkafka && \
  go get -u github.com/confluentinc/confluent-kafka-go/kafka

RUN mkdir -p /go/src/k8s.io/kubernetes &&  \
 cd /go/src/k8s.io/kubernetes && \
 curl -o kubernetes-release-1.3.tar.gz -L https://github.com/kubernetes/kubernetes/archive/v1.3.0.tar.gz && \
 tar zxvf kubernetes-release-1.3.tar.gz  && \
 rm kubernetes-release-1.3.tar.gz
