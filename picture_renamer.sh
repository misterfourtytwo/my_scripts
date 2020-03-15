#!/bin/bash

if ! type uuidgen &> /dev/null; then 
    echo "uuidgen not found, aborting"
    echo "to use this script, install this program"
    exit
fi

if ! type md5sum &> /dev/null; then 
    echo "md5sum not found, aborting"
    echo "to use this script, install this program"
    exit
fi

extensions=("jpg" "jpeg" "png" "gif" "webp")
dir="$PWD"
tmpdir="$PWD""/$(uuidgen)"
mkdir "$tmpdir"
echo "Creating $tmpdir"

for file in "$dir"/*
do
    echo "processing $file file"
    if [[ -d $file ]]; then
        printf "Ommitting directory $file.\n"
    elif [[ -f $file ]]; then
        fullname=$(basename -- "$file")
        extension="${fullname##*.}"
        filename="${fullname%.*}"
        #echo "name: $filename"
        #echo "ext: $extension"

        if [ $filename == "renamer" ]; then continue
        fi 
        
        supported_ext=false
        for ext in "${extensions[@]}"; do
          if [[ "$extension" = "$ext" ]]; then
            supported_ext=true
            break
          fi
        done
        
        if ! $supported_ext; then 
            echo "unsupported extension, ommitting file $fullname"
            continue
        fi

        md5=($(md5sum "${fullname}" ))
        echo "$fullname" \> "$tmpdir/$md5.$extension"
        mv "$fullname" "$tmpdir/$md5.$extension"
    fi
done

mv "$tmpdir"/* "$PWD"
#rm "$tmpdir/"*
rmdir "$tmpdir"
