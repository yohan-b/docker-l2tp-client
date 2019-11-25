FROM debian:buster
MAINTAINER yohan <783b8c87@scimetis.net>
ENV DEBIAN_FRONTEND noninteractive
ENV TZ Europe/Paris
RUN apt-get update && apt-get -y install xl2tpd
COPY xl2tpd.conf /etc/xl2tpd/
COPY options.l2tpd /etc/ppp/
COPY route.sh /etc/ppp/ip-pre-up
RUN chmod +x /etc/ppp/ip-pre-up
RUN mkdir -p /var/run/xl2tpd/
ENTRYPOINT ["/usr/sbin/xl2tpd", "-D"]
