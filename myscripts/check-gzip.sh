#!/bin/bash

# check if server has open gzip or not

SITE=$1

echo 'analysing...'

UNCOMPRESSED=`curl $SITE --silent --write-out "%{size_download}\n" --output /dev/null`

COMPRESSED=`curl $SITE --silent -H "Accept-Encoding: gzip,deflate" --write-out "%{size_download}\n" --output /dev/null`

echo "[$SITE]:" $UNCOMPRESSED '=>' $COMPRESSED