#!/bin/bash

# List all profiles
files=''
for file in ./profiles/*; do
    if [[ -f $file ]]; then
        t="$(basename -- $file)"
        f="${t/.env/}"
        files=$files' '$f
    fi
done
select response in $files; do
    printf "\nRunning '$response' profile..."
    ./scripts/containers.sh ./profiles/$response.env
    break
done
./scripts/homepage.sh