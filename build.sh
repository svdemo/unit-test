#!/usr/bin/env bash
set -ex
DOCKERIMAGE="tippexs/nginxspace"
DOCKERTAG="latest"

build_container() {
  docker build -t $DOCKERIMAGE:$DOCKERTAG --no-cache .
}

containerize() {
  echo "Building Container Image"
  build_container
  echo "Pushing... "
  docker push $DOCKERIMAGE:$DOCKERTAG
}

case $1 in
"push")
  echo "Building and Pushing to Remote Registry ..."
  containerize
  ;;
esac
