#!/bin/bash

FLUTTER="$HOME/Android/flutter"
current_path=$(readlink -f $FLUTTER)
rm $FLUTTER

if [[ "${current_path: -4}" == "1.22" ]]; then
      ln -sn ${FLUTTER}_rolling $FLUTTER;
      echo "swithced to rolling"
else
      ln -sn ${FLUTTER}_1.22 $FLUTTER;
      echo "swithced to 1.22"
fi
# wipe dart cache
rm -rf ~/.dartServer/.analysis-driver
# regenerate packages cache
flutter pub cache repair
