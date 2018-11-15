# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM="$HOME/.zsh/custom"

if [[ ! -d $ZSH ]]; then
	git clone git://github.com/robbyrussell/oh-my-zsh.git $ZSH
fi

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="bira"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git globalias fzf)

# User configuration

# Load oh-my-zsh
[ -f $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh

# Load zsh env, alias, ...
export ZSHRC="$HOME/.zsh"
for config ($ZSHRC/**/*.zsh) source $config

# Load fzf for zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /etc/profile.d/autojump.sh ] && source /etc/profile.d/autojump.sh
[[ -f ~/.inputrc ]] && export INPUTRC=~/.inputrc

# vi Mode
#bindkey -v
#bindkey "^P" vi-up-line-or-history
#bindkey "^N" vi-down-line-or-history

#bindkey "^[[1~" vi-beginning-of-line   # Home
#bindkey "^[[4~" vi-end-of-line         # End
#bindkey '^[[2~' beep                   # Insert
#bindkey '^[[3~' delete-char            # Del
#bindkey '^[[5~' vi-backward-blank-word # Page Up
#bindkey '^[[6~' vi-forward-blank-word  # Page Down

source ~/.zplug/init.zsh
zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
if [ "$TMUX" = "" ]; then tmux; fi
