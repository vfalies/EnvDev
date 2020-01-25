#!/bin/bash

# Stop all running containers
stop_containers() {
    docker-compose down --remove-orphans
}

stop_containers
