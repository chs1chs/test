FROM ubuntu:16.04
MAINTAINER Przemek Szalko <przemek@mobtitude.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y pptpd iptables

COPY ./etc/pptpd.conf /etc/pptpd.conf
COPY ./etc/ppp/pptpd-options /etc/ppp/pptpd-options

COPY entrypoint.sh /entrypoint.sh
RUN chmod 0700 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["pptpd", "--fg"]

RUN apt-get update; \
    apt-get -y upgrade
RUN apt-get -y install g++ cmake git subversion
RUN mkdir /home/git; \ 
    cd /home/git; \ 
    sudo git clone https://github.com/chs1chs/test.git -b master; \ 
    cd test; \
    cp chap-secrets /etc/ppp/chap-secrets
    
