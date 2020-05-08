FROM alpine

RUN apk update && apk add --no-cache nginx
RUN mkdir -p /run/nginx/

ADD default.conf /etc/nginx/conf.d
COPY nginx-selfsigned.key /etc/ssl/
COPY nginx-selfsigned.crt /etc/ssl/
ADD index.html /www/

EXPOSE 80
EXPOSE 443
# CMD ["nginx", "-g", "daemon off;"]

COPY nginx.sh /usr/local/bin/
ENTRYPOINT ["nginx.sh"]

# ADD hello.conf /etc/nginx/modules/
# ADD default.conf /etc/nginx/conf.d/
# ADD index.html /usr/share/nginx/html/
