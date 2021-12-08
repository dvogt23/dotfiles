export ZDOTDIR=$HOME/.zsh
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

if [[ ! -f ~/.zpm/zpm.zsh ]]; then
  git clone --recursive https://github.com/zpm-zsh/zpm ~/.zpm
fi
source ~/.zpm/zpm.zsh

# Plugins
zpm load zsh-users/zsh-completions,async
zpm load \
  zpm-zsh/core-config         \
  zpm-zsh/ignored-users,async \
  zpm-zsh/check-deps,async    \
  zpm-zsh/ls,async            \
  zpm-zsh/colorize,async      \
  zpm-zsh/ssh,async           \
  zpm-zsh/dot,async           \
  zpm-zsh/zsh-history-substring-search,async          \
  zpm-zsh/zsh-autosuggestions,async                   \
  zdharma-continuum/fast-syntax-highlighting,async    \
  zdharma-continuum/history-search-multi-word,fpath:/,async

zpm load wfxr/forgit
forgit_log=glof
forgit_diff=gdf
forgit_add=gaf
forgit_reset_head=grh
forgit_ignore=gi
forgit_restore=gcf
forgit_clean=gclean
forgit_stash_show=gsf

zpm load ajeetdsouza/zoxide

zpm load @omz
zpm load                \
  @omz-lib/compfix      \
  @omz-lib/completion   \
  @omz-lib/directories  \
  @omz-lib/functions    \
  @omz-lib/git          \
  @omz-lib/grep         \
  @omz-lib/history      \
  @omz-lib/key-bindings \
  @omz-lib/misc

zpm load          \
  @omz/virtualenv \
  @omz/git        \
  @omz/colored-man-pages        \
  @omz/fzf        \
  @omz/yarn       \
  @omz/rsync      \
  @omz/globalias

bindkey "ç" fzf-cd-widget

# Theme
eval "$(starship init zsh)"

# vi mode
bindkey -v
export KEYTIMEOUT=1

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^w' backward-kill-word
bindkey '^u' vi-change-whole-line
bindkey '^r' history-incremental-search-backward
bindkey '^o' vi-cmd-mode

# Use vim keys in tab complete menu:
#bindkey -M menuselect 'h' vi-backward-char
#bindkey -M menuselect 'k' vi-up-line-or-history
#bindkey -M menuselect 'l' vi-forward-char
#bindkey -M menuselect 'j' vi-down-line-or-history

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
#
#
# --------------- Set zsh history --------------- #
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt inc_append_history
setopt share_history

# --------------- Source ZDOTDIR files... --------------- #

for config ($ZDOTDIR/**/*.zsh) source $config


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
eval "$(rbenv init -)"
