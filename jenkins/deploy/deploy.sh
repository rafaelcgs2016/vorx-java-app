#!/bin/bash
echo maven-project > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth
scp -i /var/jenkins_home/secrets/labsuser.pem /tmp/.auth ec2-user@54.146.56.35:/tmp/.auth
scp -i /var/jenkins_home/secrets/labsuser.pem ./jenkins/deploy/publish ec2-user@54.146.56.35:/tmp/publish
ssh -i /var/jenkins_home/secrets/labsuser.pem ec2-user@54.146.56.35 "bash /tmp/publish"
