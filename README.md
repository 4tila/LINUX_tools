# Linux tools

Set of algorithms that use the FZF linux utility. You can put those on bashrc as custom commands by appending the following to the file

```shell
SCRIPT="~/LINNUX_tools/" # or wherever the script folder is gonna be located
alias cdd="source $SCRIPT/cdd.sh"
alias open="source $SCRIPT/open.sh"
alias bright="source $SCRIPT/bright.sh"
alias rmv="source $SCRIPT/remove.sh"
alias copy="source $SCRIPT/copy.sh"
alias hh="source $SCRIPT/hh.sh"
```

## cdd

Uses fzf to search for directories and does a cd to the chosen directory

## open

Uses fzf to search for files and opens it with some precribed applications. If no application is given, then it uses vim to open it.

Edit it to fit your needs

## bright

Application adjust screen brightness. I had to add it because in linux mint xfce there seems to be no button to adjust it

## rmv

Uses fzf to select the file or folder to be removed

## copy

Given the filename of a textfile, it copies to clipboard the content inside it.

## hh

Uses fzf to search for the history of commands and copies the command to clipboard, so that you don't need to do a "history | grep -E 'command' " and manually select the line and copy it.
