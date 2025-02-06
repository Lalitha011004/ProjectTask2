#!/bin/bash
set -e  # Exit on error

echo "🔹 Running Deploy Script"

# Ensure build.sh is executable
chmod +x build.sh

# Run the build script
./build.sh

# Debugging: Ensure environment variables are set
echo "DOCKER_USERNAME: lalithambigai011004"
echo "DOCKER_PASSWORD: Lali_0121"

# Log in securely using Docker credentials
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

# Tag and push the image
docker tag lalithambigai011004/task2 lalithambigai011004/day2task2
docker push lalithambigai011004/day2task2

echo "✅ Docker image pushed successfully!"
