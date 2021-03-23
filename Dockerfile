FROM alpine:edge
ENV PACKAGE "aria2 bash curl tzdata"

RUN apk add --no-cache $PACKAGE && \
    # Add a user to run as non root
    adduser -D -g '' aria2

COPY magnet2torrent.sh /bin/magnet2torrent.sh
RUN chmod +x /bin/magnet2torrent.sh

COPY root /var/spool/cron/crontabs/root

RUN mkdir /blackhole

CMD crond -l 2 -f
