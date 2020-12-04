#!/bin/bash

#cat binutils-urls.txt  | grep binutils- | sed -e "s/.*binutils-//" | grep tar.bz2 | sed -e "s/.tar.bz2//" | grep -E "^[0-9]+\.[0-9]+(\.[0-9]+)?$" | parallel --halt now,fail=1 --files --results build-logs ./build.sh
mkdir -p sources
cat binutils-urls.txt  | grep binutils- | sed -e "s/.*binutils-//" | grep tar.bz2 | sed -e "s/.tar.bz2//" | grep -E "^[0-9]+\.[0-9]+(\.[0-9]+)?$" | parallel --files --results build-logs ./build.sh
