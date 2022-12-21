#!/bin/bash
OS="$(uname)"
if [[ $OS == "Linux" ]]; then
    echo "Linux system";

elif [[ $OS == "Darwin" ]]; then
    echo "Mac system";

else 
    echo "unsupported $OS";
fi

