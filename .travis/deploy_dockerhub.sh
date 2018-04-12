#!/bin/sh
docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
FILE_NAME="smendiratta/cicd-pipe"
docker build -f Dockerfile -t $FILE_NAME:$TAG .
docker push $FILE_NAME:$TAG
