#!/bin/bash

if test -f "./profiles/default.env"; then
    ./scripts/containers.sh ./profiles/default.env
    ./scripts/homepage.sh
else
    echo "No default profile found. Type the command 'make profile' to create it."
fi