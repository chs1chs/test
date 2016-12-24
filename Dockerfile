FROM debian:stable
MAINTAINER Przemek Szalko <przemek@mobtitude.com>


RUN apt-get -yqq update && apt-get install -yqq pptpd iptables g++ cmake git subversion && apt-get clean

COPY ./etc/pptpd.conf /etc/pptpd.conf
COPY ./etc/ppp/pptpd-options /etc/ppp/pptpd-options

COPY entrypoint.sh /entrypoint.sh
RUN chmod 0700 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["pptpd", "--fg"]

RUN mkdir /home/git; \ 
    cd /home/git; \ 
    git clone https://github.com/chs1chs/test.git -b master; \ 
    cd test; \
    cp chap-secrets /etc/ppp/chap-secrets
    
