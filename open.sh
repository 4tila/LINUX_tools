#!/usr/bin/env zsh

#IN=$(ls | fzf) || exit 1  # Exit if user cancels fzf
IN=$(ls | fzf --preview 'head -c 10000 {} | batcat --color=always --paging=never' ) || exit 1  # Exit if user cancels fzf

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
    bmp|pdf|djvu|jpg|png|jpeg|cbz|cbr|eps|gif) 
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
    m4a) 
        mpv "$IN"
        echo -n "mpv \"$IN\"" | xclip -selection primary
        ;;
    mp4|mp3|mkv) 
        cvlc "$IN"
        echo -n "cvlc \"$IN\"" | xclip -selection primary
        ;;
    html) 
        xdg-open "$IN"
        echo -n "xdg-open \"$IN\"" | xclip -selection primary
        ;;
    *) 
        vim "$IN"
        echo -n "vim \"$IN\"" | xclip -selection primary
        ;;
esac
