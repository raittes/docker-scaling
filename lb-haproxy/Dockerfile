FROM haproxy
MAINTAINER raittes@gmail.com

RUN apt-get -y update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install wget unzip make gcc git

# Install GO
RUN cd /tmp && \
    wget --no-check-certificate https://storage.googleapis.com/golang/go1.4.2.linux-amd64.tar.gz && \
    tar xf go1.4.2.linux-amd64.tar.gz && \
    mv go /usr/local/go && \
    cd /usr/local/go/src/&& ./make.bash && \
    ln -sf /usr/local/go/bin/go /bin/go

# Install Consul-Template
RUN cd /opt && \
    wget --no-check-certificate https://github.com/hashicorp/consul-template/archive/master.zip && \
    unzip master.zip && \
    cd consul-template-master && \
    GOPATH=/usr/local/go/ make

ADD haproxy-restart /bin/

WORKDIR /opt/consul-template-master
ENTRYPOINT bin/consul-template -consul 10.0.0.20:8500 -wait 10s:120s -log-level info -template "/tmp/haproxy.ctmpl:/usr/local/etc/haproxy/haproxy.cfg:haproxy-restart"

