export CURRENT_PROJECT=$HOME/Projects/eco.banking/compeon_reverse_fe
# env vars !printenv
export PAGER='diff-so-fancy | less -R'

export ZNAP_HOME='$HOME/.znap'

export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"

### "bat" as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# organize config path
export ORGANIZE_CONFIG="$HOME/.config/organize/config.yaml"

# Defaults
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_COLLATE=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_PAPER=en_US.UTF-8
export LC_NAME=en_US.UTF-8
export LC_ADDRESS=en_US.UTF-8
export LC_TELEPHONE=en_US.UTF-8
export LC_MEASUREMENT=en_US.UTF-8
export LC_IDENTIFICATION=en_US.UTF-8
export LC_ALL=
export DOTFILES_DIR="$HOME/.dotfiles"
export PROJECT_DIR="$HOME/Projects"
export PATH="$HOME/.scripts:$PATH"
export BROWSER="/usr/bin/firefox"
export NOTES_DIR="$HOME/Nextcloud/Notes"
export EDITOR="nvim"
export GIT_EDITOR="$EDITOR"
export VISUAL="$EDITOR"
export CLICOLOR=1
export TERM=xterm-256color
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export PATH="$PATH:$HOME/Projects/misc/flutter/bin"
export PATH="$PATH:/Users/dv/Library/Python/3.8/bin"
export GPG_TTY=$(tty)

export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git --exclude .obsidian --ignore-file .gitignore'
export FZF_TMUX=1
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd -H -t d -E node_modules -E .git -E rubocop_cache -E Library/Caches'
export FZF_ALT_C_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

# pass possible vars
#export PASSWORD_STORE_DIR='.private/'
#export PASSWORD_STORE_GIT=''
export PASSWORD_STORE_CLIP_TIME=15
export PASSWORD_STORE_ENABLE_EXTENSIONS=true

# VI Mode
#set -o vi
