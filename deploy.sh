#!/bin/bash
set -e  # Exit on error

echo "🔹 Running Deploy Script"

# Ensure build.sh is executable
chmod +x build.sh

# Run the build script
./build.sh
echo "🛑 Stopping and removing existing container 'task2_container'..."
docker stop task2_container && docker rm task2_container

# Log in securely using Docker credentials
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

# Tag and push the image
docker tag lalithambigai011004/task2 lalithambigai011004/day2task2
docker push lalithambigai011004/day2task2

docker run -d -p 8085:80 --name task2test lalithambigai011004/task2

echo "✅ Docker image pushed and container started successfully!"
