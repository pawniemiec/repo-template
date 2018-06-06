#!/bin/bash

set -e

SRC=$(dirname "$0")
DST=$1
REPO=${PWD##*/}

if [ -z ${DST} ]; then
    echo -e "Usage: \n $0 <destination_repo_folder>"
    exit 1
fi

echo "Copying files from ${SRC} to ${DST}"
# if [ ! -e ${DST}/.circleci ]; then         cp -r ${SRC}/.circleci ${DST}/;       fi
if [ ! -e ${DST}/.github ]; then            cp -r ${SRC}/.github ${DST}/;         fi
if [ ! -e ${DST}/.gitignore ]; then         cp ${SRC}/.gitignore ${DST}/;         fi
if [ ! -e ${DST}/.gitattributes ]; then     cp ${SRC}/.gitattributes ${DST}/;     fi
if [ ! -e ${DST}/.editorconfig ]; then      cp ${SRC}/.editorconfig ${DST}/;      fi
if [ ! -e ${DST}/requirements.txt ]; then   cp ${SRC}/requirements.txt ${DST}/;   fi
if [ ! -e ${DST}/LICENSE.md ]; then         cp ${SRC}/LICENSE.md ${DST}/;         fi
if [ ! -e ${DST}/CONTRIBUTING.md ]; then    cp ${SRC}/CONTRIBUTING.md ${DST}/;    fi
if [ ! -e ${DST}/README.md ]; then          cp ${SRC}/README.md ${DST}/;          fi
if [ ! -e ${DST}/CODE_OF_CONDUCT.md ]; then cp ${SRC}/CODE_OF_CONDUCT.md ${DST}/; fi
if [ ! -e ${DST}/Makefile ]; then           cp ${SRC}/Makefile ${DST}/;           fi

echo Creating README.md
cat >> ${DST}/README.md <<EOF

## Prerequisites
This project is dependent on the following libs and programs:
$(sed -e 's/\(.*\)/- \1/' requirements.txt)

## Makefile
$(fgrep -h "##" Makefile | fgrep -v fgrep |sed -e 's/\(.*\)\:.*##/- \1:/')
EOF

echo "Done. Have a nice day!!!"
