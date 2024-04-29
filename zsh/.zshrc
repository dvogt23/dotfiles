export ZDOTDIR=$HOME/.zsh
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

source /opt/homebrew/share/antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundles <<BUNDLES
  compfix
  completion
  directories
  functions
  git
  grep
  history
  key-bindings
  misc
  sudo
  rails
  bundler
  docker-compose
  docker

  yarn
  globalias
  fzf
  git
  colored-man-pages
BUNDLES

ZSH_HIGHLIGHT_HIGHLIGHTERS=( main brackets )
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search

antigen bundle zdharma-continuum/fast-syntax-highlighting

antigen bundle zpm-zsh/colorize
antigen bundle zpm-zsh/ssh
antigen bundle zpm-zsh/dot
# antigen bundle ajeetdsouza/zoxide

antigen bundle smeagol74/zsh-fzf-pass@main

antigen bundle wfxr/forgit
forgit_log=glof
forgit_diff=gdf
forgit_add=gaf
forgit_reset_head=grh
forgit_ignore=gi
forgit_restore=gcf
forgit_clean=gclean
forgit_stash_show=gsf

antigen apply

bindkey "ç" fzf-cd-widget

# Theme
eval "$(starship init zsh)"

# vi mode
bindkey -v
export KEYTIMEOUT=1

bindkey "ç" fzf-cd-widget
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
# eval "$(rbenv init -)"
eval "$(frum init)"
eval "$(zoxide init zsh)"
source "$HOME/.rvm/scripts/rvm"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
