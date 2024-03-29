#!/bin/bash
dir=$(pwd) 
if ! ssh kdev "ls $dir" > /dev/null 2>&1 ; then
    echo "Creating directory"
    ssh kdev "mkdir -p $dir"
fi
rsync -rtz --del --progress --exclude '.git' $dir/ kdev:$dir/
