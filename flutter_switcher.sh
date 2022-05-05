#!/bin/bash

FLUTTER="$HOME/Android/flutter"
current_path=$(readlink -f $FLUTTER)
rm $FLUTTER

if [[ "${current_path: -2}" == "v1" ]]; then
      ln -sn ${FLUTTER}_v2 $FLUTTER;
else 
      ln -sn ${FLUTTER}_v1 $FLUTTER;
fi
