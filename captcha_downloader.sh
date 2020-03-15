#!/bin/bash

if [ -z "$1"] ; then
    echo usage: $0 count
    exit
fi

count=$1
folder=${PWD}/captchas

get_captchas(){

    if [[ ! -d $folder ]] ;
    then
        echo "creating captchas folder"
        mkdir $folder -p
    fi
    for i in `seq 0 ${1}`;
    do
        local file="${folder}/${i}.png"
        curl "https://barafranca.com/im-no-cheatar/?id=$i" > $file
        mogrify -format bmp $file
        rm $file
    done
}
echo "starting downloading ${count} captchas"
let "count--"
get_captchas $count
echo "done."



