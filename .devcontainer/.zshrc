export EDITOR="code --wait"

bindkey -v
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^K" kill-line
bindkey "^L" clear-screen
bindkey "^R" history-incremental-search-backward
bindkey "^U" kill-whole-line
bindkey "^W" backward-kill-word
bindkey "^Y" yank
