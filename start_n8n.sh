#!/bin/bash

# Source the environment variables from the .env file
if [ -f ".env" ]; then
    echo "Loading environment variables from .env..."
    . ./.env
else
    echo "Error: .env file not found."
    exit 1
fi

# First, let's launch the Docker Compose 🚀
echo "Launching the Docker Compose... 🐳"
if docker compose --env-file .env up -d --build; then
    echo "Docker Compose launched successfully! 🎉"
else
    echo "Oops! Something went wrong while launching Docker Compose. 😔"
    echo "Please check the logs for more details."
    exit 1
fi

# Wait for the n8n service to be ready
echo "Waiting for n8n to be ready... ⏳"
sleep 5

# Check if n8n is running
if docker ps | grep -q n8n; then
    echo "n8n is running successfully! 🌟"
else
    echo "Oops! n8n is not running. 😔"
    echo "Please check the logs for more details."
    exit 1
fi

# Hooray! n8n has been successfully started! 🎈🎊
echo "n8n is up and running! You can now access it at http://localhost:${N8N_PORT}/ 🌐"
open "http://localhost:${N8N_PORT}/"

# Launch tunnel
# echo "Launching tunnel..."
# docker exec -it n8n n8n start --tunnel