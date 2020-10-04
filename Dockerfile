FROM alpine:3.7
ARG tf_version="0.12.0"
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

ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY

ENV PATH "/usr/local/bin/.tfenv/bin:${PATH}"
ENV AWS_ACCESS_KEY_ID $AWS_ACCESS_KEY_ID
ENV AWS_SECRET_ACCESS_KEY $AWS_SECRET_ACCESS_KEY

RUN tfenv install 0.12.29 && tfenv use 0.12.29

RUN curl https://releases.hashicorp.com/packer/${pk_version}/packer_${pk_version}_linux_amd64.zip -o packer_${pk_version}_linux_amd64.zip
RUN unzip packer_${pk_version}_linux_amd64.zip -d /usr/local/bin && rm -f packer_${pk_version}_linux_amd64.zip
RUN ln -s /usr/local/bin/packer /usr/local/bin/packer-io

RUN mkdir -p /opt/workspace
RUN rm /var/cache/apk/*

WORKDIR /opt/workspace
RUN mkdir devops
ADD devops ./devops
ADD modules ./modules
# # CMD echo "Hello Amir this is a container used for Terraform and Nomad"

WORKDIR /opt/workspace/devops
# RUN chmod +x start.sh
