#!/bin/bash

if [ -z "$2" ]
then
    phing -f /ci/build.xml $1
else
    phing -f /ci/build.xml $1 -Dscope=selection -Dfile=$2
fi
