#!/bin/bash
#
# decrypt_dev_flash.sh -- Decrypt all dev_flash pkg files from a PUP
#
# Copyright (C) Youness Alaoui (KaKaRoTo)
#
# This software is distributed under the terms of the GNU General Public
# License ("GPL") version 3, as published by the Free Software Foundation.
#

CWD=$(pwd)

if [ "x$1" == "x" ]; then
    echo "To decrypt the dev_flash files from a PUP"
    echo "Give the path to the update_files directory"
    echo ""
    echo "   Usage : $0 <update_files_directory>"
    echo ""
    exit
fi

cd $1

for f in dev_flash*tar*; do
    unpkg $f "$(basename $f).tar"
done

for f in */content
do tar -xvf $f
done

rm -rf *.tar
cd $CWD
