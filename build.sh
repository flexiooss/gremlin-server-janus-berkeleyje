#!/usr/bin/env bash
set -x

VERSION="0.4.0"
ARCHIVE="janusgraph-${VERSION}-hadoop2.zip"

sha256sum --check $ARCHIVE.sha256
FILE_OK=$?
if [ "$FILE_OK" -ne "0" ]; then
    rm -f
    wget https://github.com/JanusGraph/janusgraph/releases/download/v$VERSION/$ARCHIVE
fi

docker-compose -f docker-compose-build.yml build "$@"
