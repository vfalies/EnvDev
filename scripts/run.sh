#!/bin/bash

# List all profiles
files=''
i=0
for file in ./profiles/*; do
    if [[ -f $file ]]; then
        t="$(basename -- $file)"
        f="${t/.env/}"
        files=$files' '$f
        i=i+1
    fi
done
if [ $i = 0 ]; then
    echo "No profile found. Type the command 'make profile' to create it."
    exit
fi
select response in $files; do
    printf "\nRunning '$response' profile...\n"
    ./scripts/containers.sh ./profiles/$response.env
    break
done
./scripts/homepage.sh