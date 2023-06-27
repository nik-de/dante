FROM alpine:latest
RUN apk add --no-cache curl openssl dante-server
COPY sockd.conf /etc/
COPY docker-entrypoint.sh /
EXPOSE 1080
ENTRYPOINT ["/docker-entrypoint.sh"]
