FROM alpine:3.7
ARG tf_version="0.15.4"
ARG pk_version="1.4.1"
RUN apk update
RUN apk upgrade
RUN apk add ca-certificates && update-ca-certificates
RUN apk add --no-cache --update \
    curl \
    unzip \
    bash \
    python \
    py-pip \
    git \
    openssh \
    make \
    libffi-dev \
    jq
RUN apk add dos2unix --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/community/ --allow-untrusted
RUN apk add --update tzdata
RUN pip install --upgrade pip
RUN pip install awscli
RUN cd /usr/local/bin && git clone https://github.com/tfutils/tfenv.git ./.tfenv

ENV PATH "/usr/local/bin/.tfenv/bin:${PATH}"

RUN tfenv install ${tf_version} && tfenv use ${tf_version}

RUN mkdir -p /opt/workspace
RUN rm /var/cache/apk/*

WORKDIR /opt/workspace
