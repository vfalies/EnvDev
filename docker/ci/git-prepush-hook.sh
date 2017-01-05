#!/bin/bash

docker run -i --rm -v $(pwd):/app vfalies/ci phing -f /ci/build.xml pre-push
