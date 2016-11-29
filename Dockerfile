FROM golang:1.7.3
RUN go get github.com/mayfield/oauth2_proxy
#WORKDIR /go/src
#RUN curl -L https://github.com/bitly/oauth2_proxy/archive/v2.1.tar.gz | \
#        tar zxv && \
#    cd oauth2_proxy-2.1 && \
#    go get -v && \
#    go build
#WORKDIR /go/bin
COPY templates /templates
EXPOSE 80
ENTRYPOINT [ \
    "oauth2_proxy", \
    "-upstream=file:///dev/null", \
    "-custom-templates-dir=/templates", \
    "-http-address=0.0.0.0:80", \
    "-request-logging=true" \
]
