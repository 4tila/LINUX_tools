IN=$(fzf)
a=(${IN//\./ })
x=${#a[@]}-1
flag=true
if [ ${a[$x]} == "mobi" ]
then
    flag=false
    calibre "$IN"
fi
if [ ${a[$x]} == "md" ]
then
    flag=false
    typora "$IN"
fi
if [ ${a[$x]} == "bmp" ] || [ ${a[$x]} == "pdf" ] || [ ${a[$x]} == "djvu" ] || [ ${a[$x]} == "jpg" ] || [  ${a[$x]} == "png" ] || [   ${a[$x]} == "jpeg" ] ||  [   ${a[$x]} == "cbz" ] ||  [   ${a[$x]} == "cbr" ]
then
    flag=false
    xdg-open "$IN"
fi
if [ ${a[$x]} == "gz" ] || [ ${a[$x]} == "tar" ]
then
    flag=false
    tar -xzvf "$IN"
fi
if [ ${a[$x]} == "tex" ]
then
    flag=false
    gummi "$IN"
fi
if [ ${a[$x]} == "wav" ]
then
    flag=false
    mpv "$IN"
fi
if [ ${a[$x]} == "lyx" ]
then
    flag=false
    lyx "$IN"
fi
if [ ${a[$x]} == "mp4" ] || [  ${a[$x]} == "mp3" ] || [ ${a[$x]} == "mkv" ]
then
    flag=false
    cvlc "$IN"
fi

if [ $flag == true ]
then
    gnome-terminal -- vim "$IN"
fi
