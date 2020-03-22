FROM djeeno/ubuntu:18.04

LABEL maintainer="djeeno <29125616+djeeno@users.noreply.github.com>"

ENV TERRAFORM_VERSION 0.12.23

RUN set -x \
  && apt-get update \
  && apt-get install -y curl ssh unzip \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && curl -fLRsS https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o terraform.zip \
  && unzip terraform.zip \
  && rm -f terraform.zip \
  && mv ./terraform /usr/local/bin \
  && terraform version \
  && set +x
