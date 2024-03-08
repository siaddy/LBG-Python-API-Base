#!/bin/bash

# Exit script if any command fails

set -e
# Welcome
echo "🌟🌟🌟 Welcome to the Simon's Docker Startup! 🌟🌟🌟"
echo "🚢 Setting sail to a mystical land of containers... 🚢"
# Define Docker image name

DOCKER_IMAGE="siaddy"

cleanup() {

    echo "Let's cleanup any mess ..."

    sleep 3

    # Add commands to clean up previous build artifacts

    docker rm -f $(docker ps -aq) || true

    docker rmi -f $(docker images) || true

    echo "Cleanup done."

}

# Function to build the Docker image

build_docker() {

    echo "Building the Docker image...🚢"

    sleep 3

    docker build -t $DOCKER_IMAGE .

}

# Function to modify the application

modify_app() {

    echo "Modifying the application...✨🎩"

    sleep 3

   export PORT=5001

    echo "Modifications done. Port is now set to $PORT"

}

# Function to run the Docker container

run_docker() {

    echo "Running Docker container..."

    sleep 3

    docker run -d -p 80:$PORT -e PORT=$PORT $DOCKER_IMAGE

}

# Main script execution

echo "Starting build process..."

sleep 3

cleanup

build_docker

modify_app

build_docker

run_docker

echo "🌟🌟🌟Build process completed successfully.🌟🌟🌟"
echo "Here is details of the Docker currently running :"
docker ps --format "table {{.Image}}\t{{.Ports}}\t{{.Names}}"
