#!/bin/bash

if test -f ".env"; then
    ./scripts/containers.sh .env
else
    echo "No default profile found (.env file). Type the command 'make profile' to create it."
fi