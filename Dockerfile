FROM alpine:latest
RUN apk --no-cache add openvpn easy-rsa tcpdump iptables
RUN mkdir /var/log/openvpn
#RUN touch /var/log/openvpn/openvpn-status.log
#RUN touch /var/log/openvpn/openvpn.log
WORKDIR /usr/openvpn

#CMD ["openvpn", "--config", "/etc/openvpn/server/server.conf"]
