#!/bin/sh
docker logout
docker login --username $DOCKER_USER --password-stdin $DOCKER_PASS
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
docker build -f Dockerfile -t $DOCKER_USER:$TAG .
docker push $DOCKER_USER:$TAG