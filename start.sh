#!/bin/bash

if [ "$1" == "" ]; then
  echo "specify folder"
  ls $(pwd) -F
  exit 0
fi

dir="$(pwd)/$1"

cd ~/envoy && bazel build --config=libc++ //source/exe:envoy-static && cd $dir

pwd

cp -f ~/envoy/bazel-bin/source/exe/envoy-static ./

docker-compose down

docker-compose up --build -d

docker ps
