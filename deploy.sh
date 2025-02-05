#!/bin/bash

echo "Starting deployment..."

# Ensure build script is executable
chmod +x build.sh

# Build Docker image
./build.sh

# Login securely to Docker Hub
echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin

# Tag and push the Docker image
docker tag test ar8888/react-capstone
docker push ar8888/react-capstone
