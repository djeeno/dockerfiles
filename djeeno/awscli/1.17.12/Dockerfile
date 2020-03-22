FROM python:3.8.2-buster

LABEL maintainer="djeeno <29125616+djeeno@users.noreply.github.com>"

ENV AWSCLI_VERSION 1.17.12

RUN set -x \
  && apt-get update \
  && apt-get install -y groff-base less \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && set +x

RUN set -x \
  && pip install awscli==${AWSCLI_VERSION:?} \
  && aws --version \
  && set +x
