#!/bin/bash

if [[ ! type "$foobar_command_name" > /dev/null ]]; then 
    echo "uuidgen not found, aborting"
    echo "to use this script, install uuidgen utility"
    exit
fi
tmpdir="${PWD}/$(uuidgen)"
mkdir $tmpdir
echo "Creating $tmpdir"

for file in  ${PWD}/*
do
    if [[ -d $file ]]; then
        printf "Ommitting directory $file.\n"
    elif [[ -f $file ]]; then
        fullname=$(basename -- "$file")
        extension="${fullname##*.}"
        filename="${fullname%.*}"
        if [ $filename == "renamer" ]; then continue
        fi
        md5=($(md5sum "${fullname}" ))
        echo "$fullname" \> "$tmpdir/$md5.$extension"
        mv "$fullname" "$tmpdir/$md5.$extension"
    fi
done

mv "$tmpdir"/* "${PWD}"
rm "$tmpdir" -r
