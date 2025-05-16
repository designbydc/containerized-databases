#! /bin/bash

echo "Resetting all containers..."
docker-compose down -v
docker-compose up -d --build