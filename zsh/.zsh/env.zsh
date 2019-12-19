# env vars !printenv

# Defaults
export LC_ALL=en_US.utf8
export DOTFILES_DIR="$HOME/.dotfiles"
export PROJECT_DIR="$HOME/Projects"
export PATH="$HOME/.scripts:$PATH"
export BROWSER="/usr/bin/firefox"
export NOTES_DIR="$HOME/Nextcloud/Notes"
export GIT_EDITOR="vim"
export VISUAL="vim"
export EDITOR="vim"
export CLICOLOR=1
export TERM=xterm-256color
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


# Rust
RUST_SRC="$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"
RUST_SRC_PATH="$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"
if [ -d $RUST_SRC ]; then
    export RUST_SRC_PATH=$RUST_SRC
fi

unset RUST_SRC
export PATH="$HOME/.cargo/bin:$PATH"

export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
export FZF_TMUX=1
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd -H -t d'
export FZF_ALT_C_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

# pass possible vars
#export PASSWORD_STORE_DIR='.private/'
#export PASSWORD_STORE_GIT=''
export PASSWORD_STORE_CLIP_TIME=15
export PASSWORD_STORE_ENABLE_EXTENSIONS=true

# VI Mode
#set -o vi
