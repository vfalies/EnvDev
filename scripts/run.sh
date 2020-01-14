#!/bin/bash

# List all profiles
files='default'
for file in ./profiles/*; do
    if [[ -f $file ]]; then
        t="$(basename -- $file)"
        f="${t/.env/}"
        files=$files' '$f
    fi
done
select response in $files; do
    echo "Running $response profile..."
    if [ $response = 'default' ];then
        ./scripts/containers.sh .env
    else
        ./scripts/containers.sh ./profiles/$response.env
    fi
    break
done