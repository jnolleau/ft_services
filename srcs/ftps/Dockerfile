FROM alpine:latest

RUN apk update && apk add openrc openssl lsof vsftpd --no-cache

COPY ftps.sh /usr/local/bin/
COPY vsftpd.conf /etc/vsftpd/

RUN chmod +x /usr/local/bin/ftps.sh

EXPOSE 21

ENTRYPOINT ["ftps.sh"]
