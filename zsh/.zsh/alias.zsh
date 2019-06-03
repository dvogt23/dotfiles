# For a full list of active aliases, run `alias`.
alias a="alias | rg "

alias zshconfig="source ~/.zshrc"
alias v='nvim'                           # Preferred 'cp' implementation
alias vi='vim'                           # Preferred 'cp' implementation
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias l='exa -1 --group-directories-first'                       # Preferred 'ls' implementation
alias ll='exa -l --group-directories-first'                       # Preferred 'ls' implementation
alias ls='exa --group-directories-first'                       # Preferred 'ls' implementation
alias lsa='exa -ls --group-directories-first'                       # Preferred 'ls' implementation
alias x='xdg-open'
alias la='exa -la --group-directories-first'                       # Preferred 'ls' implementation
alias cat='bat'
alias pc='sudo pacman'
alias pcu='sudo pacman -Syyu'
alias pcS='pacman -Ss'
alias pcs='pacman -S'
alias pca='yay'
alias pcau='yay -Syyua'
alias pcaS='yay -Ss'
alias pcas='yay -S'
alias sc='systemctl'
alias scu='systemctl --user'
alias less='less -FSRXc'                    # Preferred 'less' implementation
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias -- -='cd -'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

alias md='mkdir -p'
alias rd=rmdir

function d () {
if [[ -n $1 ]]; then
    dirs "$@"
else
    dirs -v | head -10
fi
}
compdef _dirs d
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
alias which='type -all'                     # which:        Find executables
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings
alias r='ranger'
alias ranger='ranger --choosedir=$HOME/.config/ranger/rangerdir; cd `cat $HOME/.config/ranger/rangerdir`'
alias n='notes'
alias nn='notes new'
alias no='notes open'

# unalias
#unalias rm
