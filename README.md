# FZF tools

Set of algorithms that use the FZF linux utility. You can put those on bashrc as custom commands by appending the following to the file

```shell
SCRIPT="~/script/" # or whatever the script file is gonna be located
alias dates="python3 $SCRIPT./dates.py"
alias cdd="source $SCRIPT./cdd.sh"
alias open="source $SCRIPT./open.sh"
alias rmv="source $SCRIPT./remove.sh"
```



## cdd

The cdd command uses fzf to choose which directory to perform cd, so you don't need to type the whole directory everytime you wanna cd (or maybe not even type anything at all)

<img src="https://github.com/4tila/FZF_tools/blob/main/imgs/cdd.gif" width="512" height="337" />

## open

It chooses the program to open based on file type from terminal. 

## rmv

Deletes a folder or file with the fzf utility

## dates

Calendar utility where you can add and remove important dates. It also prints how far or how close you are to each of those events


