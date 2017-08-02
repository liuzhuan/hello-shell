#!/bin/bash

# check if server has open gzip or not

# Usage: 
# $ check-gzip.sh your-target-server
# => [your-target-server]: <uncompressed size> => <compressed size>

# If <uncompressed size> equals <compressed size>, the server hasn't open
# gzip yet, else it has a working gzip function.

# Scripts based on [zoul's answer on stackoverflow](https://stackoverflow.com/questions/9140178/how-can-i-tell-if-my-server-is-serving-gzipped-content)

# This script depends on [curl](https://curl.haxx.se/) command line tool.

SITE=$1

echo 'analysing...'

UNCOMPRESSED=`curl $SITE --silent --write-out "%{size_download}\n" --output /dev/null`

COMPRESSED=`curl $SITE --silent -H "Accept-Encoding: gzip,deflate" --write-out "%{size_download}\n" --output /dev/null`

echo "[$SITE]:" $UNCOMPRESSED '=>' $COMPRESSED