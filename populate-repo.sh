#!/bin/bash

set -e

DEST=$1

if [ -z ${DEST} ]; then
    echo -e "Usage: \n $0 <destination_repo_folder>"
    exit 1
fi

cp -r .circleci ${DEST}
cp -r .github ${DEST}
cp .gitignore ${DEST}
cp .editorconfig ${DEST}
cp LICENSE ${DEST}

