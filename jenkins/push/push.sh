#!/bin/bash
echo "********************"
echo "** Pushing image ***"
echo "********************"

IMAGE="maven-project"

echo "** Logging in ***"
docker login -u rafaelcgs -p $PASS

echo "*** Tagging image ***"
docker tag $IMAGE:$BUILD_TAG rafaelcgs/$IMAGE:$BUILD_TAG

echo "*** Pushing image ***"
docker push rafaelcgs/$IMAGE:$BUILD_TAG
