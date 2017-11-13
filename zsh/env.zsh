# Defaults
export DOTFILES_DIR="$HOME/.dotfiles"
export PATH="$HOME/.scripts:$PATH"
export BROWSER="/usr/bin/chromium"
export GIT_EDITOR="nvim"
export VISUAL="nvim"
export EDITOR="nvim"
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

# Rust for vim ide
# Arch path
RUST_SRC="$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"
if [ -d $RUST_SRC ]; then
    export RUST_SRC_PATH=$RUST_SRC
fi

# OSX path
RUST_SRC="$HOME/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src"
if [ -d $RUST_SRC ]; then
    export RUST_SRC_PATH=$RUST_SRC
fi

unset RUST_SRC

export PATH="$HOME/.cargo/bin:$PATH"

# FZF <Alt>-c shortcut
export FZF_DEFAULT_COMMAND='fd -H "" ~'
export FZF_TMUX=1
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd -H -t d'
export FZF_ALT_C_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

# pass possible vars
#export PASSWORD_STORE_DIR='.private/'
#export PASSWORD_STORE_GIT=''
export PASSWORD_STORE_CLIP_TIME=15
