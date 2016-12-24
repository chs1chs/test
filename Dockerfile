FROM mobtitude/vpn-pptp
MAINTAINER Przemek Szalko <przemek@mobtitude.com>
RUN echo "pptp pptpd password *" >> /etc/ppp/chap-secrets
    
