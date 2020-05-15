FROM alpine

# Installation
RUN apk update && apk add phpmyadmin --no-cache --quiet

# COPY pma.sh /usr/local/bin/

EXPOSE 5000

CMD ["sh", "-c", "tail -f /dev/null"]

# ENTRYPOINT ["pma.sh"]
