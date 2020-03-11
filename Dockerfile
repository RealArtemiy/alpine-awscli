FROM alpine:3.9

ENV AWSCLI_VERSION "1.18.18"

RUN apk add --update \
    python \
    python-dev \
    py-pip \
    build-base \
    && pip install awscli==$AWSCLI_VERSION --upgrade --user \
    && apk --purge -v del py-pip \
    && rm -rf /var/cache/apk/*

RUN ln -s /root/.local/bin/aws /usr/bin/
