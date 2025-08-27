#!/usr/bin/env sh
set -e

docker build -t ${CI_REGISTRY}/${CI_REGISTRY_IMAGE}:${IMAGE_TAG} .
docker push ${CI_REGISTRY}/${CI_REGISTRY_IMAGE}:${IMAGE_TAG}
