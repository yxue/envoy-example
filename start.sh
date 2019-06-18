#!/bin/bash

cd ~/envoy && bazel build //source/exe:envoy-static && cd ~/Envoy-Example

cp -f ~/envoy/bazel-bin/source/exe/envoy-static ./

docker-compose down

docker-compose up --build -d

docker ps
