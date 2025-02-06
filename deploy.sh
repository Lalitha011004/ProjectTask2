#!/bin/bash
set -e  # Exit on error

echo "🔹 Running Deploy Script"

# Ensure build.sh is executable
chmod +x build.sh

# Run the build script
./build.sh

# Stop and remove the existing container if it exists
if docker ps -a --format '{{.Names}}' | grep -q '^task2_container$'; then
    echo "🛑 Stopping and removing existing container 'task2_container'..."
    docker stop task2_container && docker rm task2_container
else
    echo "✅ No existing container 'task2_container' found."
fi

# Log in securely using Docker credentials
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

# Tag and push the image
docker tag lalithambigai011004/task2 lalithambigai011004/day2task2
docker push lalithambigai011004/day2task2

# Run the container with the new image
docker run -d -p 8085:80 --name task2_container lalithambigai011004/task2

echo "✅ Docker image pushed and container started successfully!"
