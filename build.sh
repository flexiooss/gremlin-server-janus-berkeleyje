#!/usr/bin/env bash

VERSION="0.3.1"
ARCHIVE="janusgraph-${VERSION}-hadoop2.zip"

FILE_OK=$(sha256sum --check $ARCHIVE.sha256)
if [ "$FILE_OK" -ne "0" ]; then
    rm -f
    wget https://github.com/JanusGraph/janusgraph/releases/download/v$VERSION/$ARCHIVE
fi

docker-compose -f docker-compose-build.yml build "$@"
