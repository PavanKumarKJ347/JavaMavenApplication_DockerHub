#!/bin/bash
set -e

#Pull Docker Image from DockerHub
docker pull devopscloudautomation/javadockerapplication:65

#Run Docker Image as a Container
docker run -d --name javadockercontainer -p 8080:8080 devopscloudautomation/javadockerapplication:65
