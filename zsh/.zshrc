export ZDOTDIR=$HOME/.zsh
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

### Added by Zinit's installer
if [[ ! -f $HOME/.zsh/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$HOME/.zsh/.zinit" && command chmod g-rwX "$HOME/.zsh/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zsh/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zsh/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

# zinit
zinit ice wait lucid blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

zinit snippet OMZ::lib/completion.zsh

zinit snippet OMZ::lib/key-bindings.zsh

zinit ice wait lucid
zinit snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh

zinit ice as"completion"
zinit snippet OMZ::plugins/fd/_fd

zinit ice wait lucid
zinit snippet OMZ::plugins/fzf/fzf.plugin.zsh

zinit ice wait lucid
zinit snippet OMZ::plugins/yarn/yarn.plugin.zsh

zinit ice wait lucid
zinit snippet OMZ::plugins/git/git.plugin.zsh

zinit ice wait lucid
zinit snippet OMZ::plugins/docker-compose/docker-compose.plugin.zsh 

zinit ice wait lucid
zinit snippet OMZ::plugins/globalias/globalias.plugin.zsh

zinit ice wait'1' lucid
zinit light wfxr/forgit

forgit_log=glof
forgit_diff=gdf
forgit_add=gaf
forgit_reset_head=grh
forgit_ignore=gi
forgit_restore=gcf
forgit_clean=gclean
forgit_stash_show=gsf

zinit ice wait lucid atload'zicompinit; zicdreplay'
zinit light zdharma/fast-syntax-highlighting

zinit light ajeetdsouza/zoxide

# Auto manage zplug
# zplug 'zplug/zplug', hook-build:'zplug --self-manage'
# zplug "plugins/brew-cask", from:oh-my-zsh
# zplug "plugins/osx", from:oh-my-zsh
# zplug "plugins/pod", from:oh-my-zsh

# # From oh-my-zsh
# zplug "plugins/globalias", from:oh-my-zsh
# zplug "plugins/git", from:oh-my-zsh
# zplug "plugins/colored-man-pages", from:oh-my-zsh
# # zplug "plugins/cargo", from:oh-my-zsh
# zplug "lib/key-bindings", from:oh-my-zsh
# zplug "lib/completion", from:oh-my-zsh

# # From Github
# zplug "zpm-zsh/zpm", use:"plugins/{cd,git,zsh-core}"
# zplug "zsh-users/zsh-completions"

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
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

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
