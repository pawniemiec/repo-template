#!/bin/bash

set -e

SRC=$(dirname "$0")
DST=$1

if [ -z ${DST} ]; then
    echo -e "Usage: \n $0 <destination_repo_folder>"
    exit 1
fi

echo "Copying files from ${SRC} to ${DST}"
if [ ! -e ${DST}/.circleci ]; then        cp -r ${SRC}/.circleci ${DST}/;     fi
if [ ! -e ${DST}/.github ]; then          cp -r ${SRC}/.github ${DST}/;       fi
if [ ! -e ${DST}/.gitignore ]; then       cp ${SRC}/.gitignore ${DST}/;       fi
if [ ! -e ${DST}/.editorconfig ]; then    cp ${SRC}/.editorconfig ${DST}/;    fi
if [ ! -e ${DST}/requirements.txt ]; then cp ${SRC}/requirements.txt ${DST}/; fi
if [ ! -e ${DST}/LICENSE ]; then          cp ${SRC}/LICENSE ${DST}/;          fi

cat >> $DST/README.md <<EOF

## Prerequisites
This project is dependent on the following libs and programs:
$(sed -e 's/\(.*\)/- \1/' requirements.txt)

## License
All code is licensed under MIT license.

## Makefile
$(fgrep -h "##" Makefile | fgrep -v fgrep |sed -e 's/\(.*\)\:.*##/- \1:/')
EOF

echo "Done. Have a nice day!!!"

