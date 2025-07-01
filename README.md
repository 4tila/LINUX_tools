# Linux Tools

A collection of shell scripts that leverage [`fzf`](https://github.com/junegunn/fzf), which is designed for quick access to files, directories, clipboard contents, and more.

You can turn them into custom commands by sourcing them in your `.bashrc` (or `.zshrc`) file:

```bash
SCRIPT="$HOME/LINUX_tools"  # Replace with the actual path to the script folder

alias cdd="source $SCRIPT/cdd.sh"
alias open="source $SCRIPT/open.sh"
alias bright="source $SCRIPT/bright.sh"
alias rmv="source $SCRIPT/remove.sh"
alias copy="source $SCRIPT/copy.sh"
alias hh="source $SCRIPT/hh.sh"
alias backup="source $SCRIPT/backup.sh"
```

> ⚠️ Make sure `fzf` and `xclip` (for clipboard usage) are installed on your system.
> Change the `xclip -selection` command depending on your needs.

---

## Available Commands

### `cdd`

Fuzzy-find a directory and change into it.

* Uses `fzf` to search through directories.
* Great for quickly navigating large projects or nested folders.

---

### `open`

Fuzzy-find a file, open it and copies the command to clipboard

* Defaults to `vim`, but can be customized to use other applications.
* Handy for launching media files, documents, or code editors directly.
* Also **copies the command used to open the file to the clipboard**, so you can easily reuse it without re-running `open`.

> 🔧 For example, selecting `movie.mp4` will open it with `cvlc movie.mp4` and copy that command to your clipboard for later use.

> 🔧 Edit the script to configure default applications by filetype.

---

### `bright`

Adjust screen brightness from the terminal.

* Especially useful on desktops or environments like Linux Mint XFCE where brightness controls might be missing.


---

### `rmv`

Fuzzy-select files or folders and remove them safely.

* Prevents mistakes by requiring an explicit selection via `fzf`.
* Has an "Are you sure?" to not destroy files unintentionally


---

### `copy`

Copy the contents of a text file to the clipboard.

* Useful when you want to paste configuration snippets, code, or text quickly.

---

### `hh`

Fuzzy-search your shell history and copy a command to the clipboard.

* Faster alternative to `history | grep` followed by manually copying the line.
* Useful for reusing long or complex commands without retyping.

---

### `backup`

Performs backups to sandisk of Desktop folder using rsync

---

## License

MIT License – use, modify, and share freely.

