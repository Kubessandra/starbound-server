#!/bin/sh

docker build . -t starbound-server
docker tag starbound-server:latest gcr.io/k8s-gaming/starbound-server:latest
docker push gcr.io/k8s-gaming/starbound-server:latest
