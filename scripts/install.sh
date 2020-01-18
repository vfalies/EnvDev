#!/bin/bash

if ! test -f "./profiles/default.env"; then
    echo "No default profile found. Type 'make profile' to create it."
    exit
fi
cp ./profiles/default.env ./.env