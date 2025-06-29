#!/usr/bin/env zsh

## Open's the file and also adds the command to open the file to clipboard
## so that you just paste the command to terminal (shift+insert for me) in case
## you need to do it again

IN=$(ls | fzf) || exit 1  # Exit if user cancels fzf

if [[ -z "$IN" ]]; then
    exit 1
fi

ext="${IN##*.}" # the ## removes the longest string match of *. and # the shortest

case "$ext" in
    mobi) 
        calibre "$IN"
        echo -n "calibre \"$IN\"" | xclip -selection primary
        ;;
    md) 
        typora "$IN"
        echo -n "typora \"$IN\"" | xclip -selection primary
        ;;
    bmp|pdf|djvu|jpg|png|jpeg|cbz|cbr|eps) 
        xdg-open "$IN"
        echo -n "xdg-open \"$IN\"" | xclip -selection primary
        ;;
    gz|tar) 
        tar -xzvf "$IN"
        echo -n "tar -xzvf \"$IN\"" | xclip -selection primary
        ;;
    tex) 
        gummi "$IN"
        echo -n "gummi \"$IN\"" | xclip -selection primary
        ;;
    wav) 
        mpv "$IN"
        echo -n "mpv \"$IN\"" | xclip -selection primary
        ;;
    lyx) 
        lyx "$IN"
        echo -n "lyx \"$IN\"" | xclip -selection primary
        ;;
    mp4|mp3|mkv) 
        cvlc "$IN"
        echo -n "cvlc \"$IN\"" | xclip -selection primary
        ;;
    py)
        python3 "$IN"
        echo -n "python3 \"$IN\"" | xclip -selection primary
        ;;
    *) 
        vim "$IN"
        echo -n "vim \"$IN\"" | xclip -selection primary
        ;;
esac
