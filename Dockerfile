FROM alpine:edge
MAINTAINER Tim Chan <tim@chan.net>
ENV PACKAGE "aria2 bash curl tzdata"

RUN apk add --no-cache $PACKAGE && \
    # Add a user to run as non root
    adduser -D -g '' aria2

EXPOSE 6800
USER aria2
ENV HOME /home/aria2

CMD ["/usr/bin/aria2c", "--conf-path=/config/aria2.conf"]
