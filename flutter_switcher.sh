#!/bin/bash

FLUTTER="$HOME/Android/flutter"
current_path=$(readlink -f $FLUTTER)
rm $FLUTTER

if [[ "${current_path: -4}" == "1.22" ]]; then
      ln -sn ${FLUTTER}_rolling $FLUTTER;
else 
      ln -sn ${FLUTTER}_1.22 $FLUTTER;
fi
