#!/bin/bash

while IFS= read -r line
do
    uuid=$(uuidgen)
    echo "$line $uuid" >> outfile.txt
done < tmp
