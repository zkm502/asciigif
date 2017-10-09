#!/bin/bash
if [ "$1" != "" ]; then
    FRAMES=gifimgout%05d.jpg
    GIF=$1
    if [ "$2" != "" ]; then
        SPEED=$2
    else
        SPEED=0.05
    fi
    if [ "$3" != "" ]; then
        COLORS="--colors"
    else
        COLORS="--grayscale"
    fi

    
    # Split the gif / gifv into frames
    if [ -f $VID ]; then
      #  ffmpeg -i $VID $FRAMES > /dev/null 2>&1
        convert -coalesce $GIF $FRAMES > /dev/null 2>&1
    elif [ -f $GIF ]; then
        convert -coalesce $GIF $FRAMES > /dev/null 2>&1
    fi

    #Display each frame in ASCII, sleep, and clear the screen
    for img in gifimgout*.jpg; do
        jp2a -f $COLORS $img
        sleep $SPEED 
        clear
    done

    # Tidy up
    rm gifimgout*.jpg gifs in.gif in.gifv 2> /dev/null

else
    echo "No file"
fi
