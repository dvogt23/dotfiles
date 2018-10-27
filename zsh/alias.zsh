# For a full list of active aliases, run `alias`.
alias a="alias | rg "

alias zshconfig="source ~/.zshrc"
#alias ohmyzsh="mate ~/.oh-my-zsh"
alias e='emacsclient -t'
alias ew='emacsclient'
alias cc='calcurse'
alias v='nvim'                           # Preferred 'cp' implementation
alias vi='nvim'                           # Preferred 'cp' implementation
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='exa -l --group-directories-first'                       # Preferred 'ls' implementation
alias ls='exa --group-directories-first'                       # Preferred 'ls' implementation
alias lsa='exa -ls --group-directories-first'                       # Preferred 'ls' implementation
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
alias edit='subl3'                           # edit:         Opens any file in sublime editor
alias sub='subl3'                           # edit:         Opens any file in sublime editor
alias s='subl3'                           # edit:         Opens any file in sublime editor
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
alias which='type -all'                     # which:        Find executables
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings
alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
alias r='ranger'
alias ranger='ranger --choosedir=$HOME/.config/ranger/rangerdir; cd `cat $HOME/.config/ranger/rangerdir`'
alias DT='tee ~/Desktop/terminalOut.txt'    # DT:           Pipe content to file on MacOS Desktop


 # Opens a note
 ne() {
   nvim -c ":Note $*"
 }

 ## New Note: calls vim notes plugin
 n() {
   nvim ~/.notes/SUMMARY.md
 }

 # Searches Notes
 nls() {
   exa ~/.notes/ | egrep -i "$*"
 }
 
# unalias
#unalias rm
