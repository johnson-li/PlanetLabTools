#!/bin/bash
base=$(pwd)
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
    echo 'usage: planet-upload [path ...]'
    exit 0
fi

path="$base/$1"
shift

while [[ $# > 0 ]]
do
    url=$1
    scp -rp $path $slice_name@$url:~/ > /dev/null
    res=`ssh $slice_name@$url "$(basename $path)/init.sh"`
    if [[ "$res" == 'ok' ]] ; then
        echo "deploy to $url successfully"
    else
        echo "deploy to $url failed"
    fi
    shift
done

echo 'planet lab upload completed'
