#!/bin/bash
set -e

# Pull the Docker image from Docker Hub
docker pull devopscloudautomation/javadockerapplication:35

# Run the Docker image as a container
docker run -d --name javadockercontainer -p 8080:8080 devopscloudautomation/javadockerapplication:35
