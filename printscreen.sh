#/bin/bash

prntscr(){

    if spectacle --region --nonotify --background --output $HOME/pictures/tmp.png
    then 
        if [ -f $HOME/pictures/screenshot.png ] 
        then
            rm $HOME/pictures/screenshot.png;
        fi
        mv $HOME/pictures/tmp.png $HOME/pictures/screenshot.png
        xclip -selection clipboard -t image/png -i $HOME/pictures/screenshot.png;
    fi
}

prntscr
