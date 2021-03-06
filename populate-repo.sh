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
if [ ! -e ${DST}/.github ]; then            cp -r ${SRC}/.github ${DST}/;         fi
if [ ! -e ${DST}/.gitlab ]; then            cp -r ${SRC}/.gitlab ${DST}/;         fi
if [ ! -e ${DST}/.gitignore ]; then         cp ${SRC}/.gitignore ${DST}/;         fi
if [ ! -e ${DST}/.gitattributes ]; then     cp ${SRC}/.gitattributes ${DST}/;     fi
if [ ! -e ${DST}/.editorconfig ]; then      cp ${SRC}/.editorconfig ${DST}/;      fi
if [ ! -e ${DST}/LICENSE.md ]; then         cp ${SRC}/LICENSE.md ${DST}/;         fi
if [ ! -e ${DST}/CONTRIBUTING.md ]; then    cp ${SRC}/CONTRIBUTING.md ${DST}/;    fi
if [ ! -e ${DST}/README.md ]; then          cp ${SRC}/README.md ${DST}/;          fi
if [ ! -e ${DST}/CODE_OF_CONDUCT.md ]; then cp ${SRC}/CODE_OF_CONDUCT.md ${DST}/; fi

echo Creating/updating README.md
cat >> ${DST}/README.md <<EOF

## Prerequisites

This project is dependent on the following libs and programs:

## Installing / Getting started

## Developing

### Building

### Deploying / Publishing

## Configuration

## Features

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our the process for submitting pull requests
and code of conduct.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

EOF

echo "Done. Have a nice day!!!"
