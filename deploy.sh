#!/bin/bash
set -e  # Exit on error

echo "🔹 Running Deploy Script"

# Ensure build.sh is executable
chmod +x build.sh

# Run the build script
./build.sh

# Stop and remove the existing container if it exists
echo "🔹 Checking if 'task2_container' exists..."

# Stop the container if it's running
docker ps -a --filter "name=task2_container" --format '{{.ID}}' | xargs -r docker stop

# Remove the container if it exists
docker ps -a --filter "name=task2_container" --format '{{.ID}}' | xargs -r docker rm

# Log in securely using Docker credentials
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

# Tag and push the image
docker tag lalithambigai011004/task2 lalithambigai011004/day2task2
docker push lalithambigai011004/day2task2

# Run the container with the new image
docker run -d -p 8085:80 --name task2_container lalithambigai011004/task2

echo "✅ Docker image pushed and container started successfully!"
