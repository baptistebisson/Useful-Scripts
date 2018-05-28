#!/bin/bash
prompt="Select scss file ?"
options=( $(find -maxdepth 1 -print0 | xargs -0) )

PS3="$prompt "
select FILENAME in *; do 
    if (( REPLY == 1 + ${#options[@]} )) ; then
        exit

    elif (( REPLY > 0 && REPLY <= ${#options[@]} )) ; then
        if [[ $FILENAME = *".scss"* ]]; then
            css=".min.css"
            command="sass --watch $FILENAME:${FILENAME/.scss/$css} --precision 10 --style compressed"
            eval $command
            break
        else
            echo "Not a scss file"
        fi

    else
        echo "Invalid option. Try another one."
    fi
done