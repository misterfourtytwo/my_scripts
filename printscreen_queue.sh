#/bin/bash

prntscr(){
    if [[ ! -d $HOME/pictures/screenshots ]] ;
    then
        mkdir $HOME/pictures/screenshots -p
    fi

    spectacle --region --nonotify --background --output $HOME/pictures/screenshots/$(date +year%Y.day%j.time%H:%m:%S).png
}

prntscr
