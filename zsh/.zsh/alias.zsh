alias a="alias | rg "

alias -- -='cd -'
alias ...='cd ../../'                       # Go back 2 directory levels
alias ..='cd ../'                           # Go back 1 directory level
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'
alias cat='bat'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias e='emacs'
alias emacs="emacsclient -a ''"
alias l='exa -1 --group-directories-first'                       # Preferred 'ls' implementation
alias la='exa -la --group-directories-first --icons'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
alias ll='exa -l --group-directories-first --icons'                       # Preferred 'ls' implementation
alias ls='exa --group-directories-first'                       # Preferred 'ls' implementation
alias lsa='exa -ls --group-directories-first'                       # Preferred 'ls' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias pc='sudo pacman'
alias pcS='pacman -Ss'
alias pca='yay'
alias pcaS='yay -Ss'
alias pcas='yay -S'
alias pcau='yay -Syyua'
alias pcs='pacman -S'
alias pcu='sudo pacman -Syyu'
alias sc='systemctl'
alias scu='systemctl --user'
alias v='nvim'                           # Preferred 'cp' implementation
alias vi='nvim'                           # Preferred 'cp' implementation
alias vim='nvim'                           # Preferred 'cp' implementation
alias x='xdg-open'
alias zshconfig="source ~/.zshrc"
alias gapa="git add --intent-to-add . && git add --patch"

alias killft='killall -kill FaceTimeNotificationCenterService'
alias gcof='git cof'

alias md='mkdir -p'
alias rd=rmdir

function d () {
if [[ -n $1 ]]; then
    dirs "$@"
else
    dirs -v | head -10
fi
}
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
alias which='type -all'                     # which:        Find executables
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings
alias r='ranger'
alias ranger='ranger --choosedir=$HOME/.config/ranger/rangerdir; cd `cat $HOME/.config/ranger/rangerdir`'
alias n='notes'
alias nw='nvim +VimwikiIndex'
alias nn='notes new'
alias no='notes open'
alias nd='nvim +VimwikiMakeDiaryNote'
alias j='z'

