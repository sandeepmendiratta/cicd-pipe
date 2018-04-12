#!/bin/sh
# test
docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
#docker build -f Dockerfile -t $TRAVIS_REPO_SLUG:$TAG .
FILENAME="smendiratta/cicd-pipe"
docker build -f Dockerfile -t $FILENAME:$TAG .
docker push $FILENAME:$TAG
