#!/bin/bash

HOME_TMP=~/tmp
MAC_DROPBOX=~/Dropbox/src

if [ -e ${HOME_TMP} ]; then
    echo "~/tmp existed"
    rm -rf ${HOME_TMP}
    echo "~/tmp was removed"
fi
ln -sfv ${MAC_DROPBOX}/tmp ${HOME_TMP}
