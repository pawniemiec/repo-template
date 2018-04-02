#!/bin/bash

set -e

SRC=$(dirname "$0")
DST=$1

if [ -z ${DST} ]; then
    echo -e "Usage: \n $0 <destination_repo_folder>"
    exit 1
fi

echo "Copying files from ${SRC} to ${DST}"
cp -r ${SRC}/.circleci ${DST}/
cp -r ${SRC}/.github ${DST}/
cp ${SRC}/.gitignore ${DST}/
cp ${SRC}/.editorconfig ${DST}/
cp ${SRC}/LICENSE ${DST}/
echo "Done. Have a nice day!!!"

