#!/bin/bash

# Variables
DOCKER_USERNAME="your_dockerhub_username"
REPOSITORY_NAME="your_repository_name"
IMAGE_NAME="backend" # Change to your backend service name
VERSION_PREFIX="v"

# Build the Docker images
docker-compose build

# Get existing tags for the image
EXISTING_TAGS=$(curl -s "https://hub.docker.com/v2/repositories/$DOCKER_USERNAME/$REPOSITORY_NAME/tags?page_size=100" | jq -r '.results[].name')

# Find the next version tag
NEXT_VERSION=1

# Loop to find the next version
for TAG in $EXISTING_TAGS; do
    if [[ $TAG == $VERSION_PREFIX* ]]; then
        VERSION_NUMBER=${TAG#$VERSION_PREFIX}
        if [[ $VERSION_NUMBER =~ ^[0-9]+$ ]]; then
            if (( VERSION_NUMBER >= NEXT_VERSION )); then
                NEXT_VERSION=$((VERSION_NUMBER + 1))
            fi
        fi
    fi
done

# Create new version tag
NEW_TAG="${VERSION_PREFIX}${NEXT_VERSION}"

# Tag and push images
docker tag "$REPOSITORY_NAME/$IMAGE_NAME:latest" "$DOCKER_USERNAME/$REPOSITORY_NAME:$NEW_TAG"
docker push "$DOCKER_USERNAME/$REPOSITORY_NAME:$NEW_TAG"

# Optionally, you can also push the latest tag
docker tag "$REPOSITORY_NAME/$IMAGE_NAME:latest" "$DOCKER_USERNAME/$REPOSITORY_NAME:latest"
docker push "$DOCKER_USERNAME/$REPOSITORY_NAME:latest"

echo "Successfully pushed image with tag: $NEW_TAG"

