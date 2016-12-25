#FROM mobtitude/vpn-pptp
#MAINTAINER Przemek Szalko <przemek@mobtitude.com>
#RUN echo "pptp pptpd password *" >> /etc/ppp/chap-secrets

FROM debian:latest
# 维护者信息
MAINTAINER haha@haha.com

# 镜像操作命令
RUN apt-get -yqq update && apt-get install -yqq build-essential autoconf libtool libssl-dev gcc git && apt-get clean
RUN git clone https://github.com/madeye/shadowsocks-libev.git 
    && cd shadowsocks-libev
    && ./configuremake && make install
