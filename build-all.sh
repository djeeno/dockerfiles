#!/usr/bin/env bash

cd "$(dirname "$0")" || exit 1

dockerfiles=$(
# find . -name Dockerfile | sed "s|^./||; s|/Dockerfile$||"
cat << LIST
# ubuntu
djeeno/ubuntu/18.04
# terraform
djeeno/terraform/0.12.23
# awscli
djeeno/awscli/1.17.12
LIST
)

echo "${dockerfiles:?}" | grep -Ev "^ *#|^ *$" | while read -r build_context; do
  (
    # Confine the cd command's sphere of influence to a subshell.
    cd "${build_context:?}" || exit 1
    # vars
    # shellcheck disable=SC2001
    DOCKER_TAG=$(echo "${build_context:?}" | sed "s|/\([^/]*\)$|:\1|")
    # build
    docker build --tag "${DOCKER_TAG:?}" . && docker push "${DOCKER_TAG:?}"
  )
done

