#!/bin/bash
if [[ -L $0 ]] ; then
    path=$(readlink "$0")
else
    path=$0
fi
cd $(dirname "$path")

source config.sh
###data imported from config.sh
slice_name=$slice_name

if [[ "$#" == '0' || "$1" == '-h' ]]
then
    echo 'usage: planet-connect url'
    exit 0
fi

ssh $slice_name@$1

