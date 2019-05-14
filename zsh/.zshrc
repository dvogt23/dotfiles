export ZPLUG_HOME=$HOME/.zplug
export ZDOTDIR=$HOME/.zsh

if [[ -d $ZPLUG_HOME ]]; then
    source $ZPLUG_HOME/init.zsh
else
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
    RELOAD=1 source $HOME/.zshrc
fi

# Auto manage zplug
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# From oh-my-zsh
zplug "plugins/globalias", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/cargo", from:oh-my-zsh
zplug "lib/key-bindings", from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh

# From Github
zplug "zpm-zsh/zpm", use:"plugins/{cd,git,zsh-core}"
zplug "zsh-users/zsh-completions"

# Theme
zplug "mafredri/zsh-async", from:github
AGKOZAK_CUSTOM_SYMBOLS=( '⇣⇡' '⇣' '⇡' '+' 'x' '!' '>' '?' )
AGKOZAK_LEFT_PROMPT_ONLY=1
AGKOZAK_PROMPT_CHAR=( ❯ ❯ ❮ )
AGKOZAK_COLORS_PROMPT_CHAR='yellow'
zplug "agkozak/agkozak-zsh-prompt"

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
    zplug install
fi

zplug load

# --------------- Set zsh history --------------- #
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt inc_append_history
setopt share_history

# --------------- Source ZDOTDIR files... --------------- #

for config ($ZDOTDIR/**/*.zsh) source $config

compinit

# Load fzf for zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /etc/profile.d/autojump.zsh ] && source /etc/profile.d/autojump.zsh
