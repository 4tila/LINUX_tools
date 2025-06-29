history | fzf --tac --no-sort | awk '{for (i=2; i<=NF; i++) printf "%s ", $i; print ""}' |  xclip -selection primary
