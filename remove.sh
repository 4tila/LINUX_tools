x=$(ls | fzf)
read -r -p "Are you sure?[y/n]" response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    rm -rf "$x"
fi
