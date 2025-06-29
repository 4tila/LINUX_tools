x=$(ls | fzf)
read -q "confirm?Do you want to proceed? (y/n) "
if [[ $confirm =~ ^([yY][eE][sS]|[yY])$ ]]
then
    rm -rf "$x"
fi
