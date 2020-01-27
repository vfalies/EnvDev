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
    printf "\nDeleting '$response' profile...\n"
    echo "Are you sure ?"
    select validation in Yes No; do
        if [ "$validation" = "Yes" ]; then
            rm ./profiles/$response.env
            echo "Profile deleted"
        else
            echo "Deletion canceled"
        fi
        break;
    done
    break
done