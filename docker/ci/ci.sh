#!/bin/bash

##BE CAREFUL this file must be with "LF" Line ending not "CRLF", if not docker entrypoint does not works

if [ -z "$2" ]
then
    phing -f /ci/build.xml $1
else
    phing -f /ci/build.xml $1 -Dscope=selection -Dfile=$2
fi
