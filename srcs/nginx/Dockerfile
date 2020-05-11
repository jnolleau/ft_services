FROM alpine:latest

RUN apk update && apk add --no-cache nginx php-fpm
RUN mkdir -p /run/nginx/

ADD default.conf /etc/nginx/conf.d
COPY nginx-selfsigned.key /etc/ssl/
COPY nginx-selfsigned.crt /etc/ssl/
ADD index.php /www/
ADD index.html /www/
# ADD include.php /www/

COPY nginx.sh /usr/local/bin/

RUN /usr/local/bin/nginx.sh

EXPOSE 22 80 443

# CMD ["nginx", "-g", "daemon off;"]
# ENTRYPOINT ["nginx.sh"]
ENTRYPOINT /usr/sbin/php-fpm7; nginx -g "daemon off;"
# ADD hello.conf /etc/nginx/modules/
# ADD default.conf /etc/nginx/conf.d/
# ADD index.html /usr/share/nginx/html/
