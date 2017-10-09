#!/bin/bash
if [[ "$1" != "" ]]; then
    frames="gifimgout%05d.jpg"
    #TO DO, better parameter input
    gif="$1"
    if [[ "$2" != "" ]]; then
        speed="$2"
    else
        speed="0.05"
    fi
    if [[ "$3" != "" ]]; then
        colors="--colors"
    else
        colors="--grayscale"
    fi
    
    # Split the gif / gifv into frames
    if [[ -f $vid ]]; then
      #  ffmpeg -i $VID $FRAMES > /dev/null 2>&1 #not implemented yet
        convert -coalesce $gif $frames > /dev/null 2>&1
    elif [[ -f $gif ]]; then
        convert -coalesce $gif $frames > /dev/null 2>&1
    fi

    #Display each frame in ASCII, sleep, and clear the screen
    for img in gifimgout*.jpg; do
        jp2a -f $colors $img
        sleep $speed
        printf '\033[H' #Uses ANSI sequence to smoth playback on slower tty's
    done
    clear

    # Tidy up
    rm gifimgout*.jpg gifs in.gif in.gifv 2> /dev/null

else
    echo "No file"
fi
