#/usr/bin/env bash

DOTFILES="$HOME/.dotfiles"
FILES="$(cat "$DOTFILES"/dotfilesrc)"

# colors
YEL='\e[93m'
GRN='\e[32m'
RED='\e[31m'
NC='\033[0m'

# set dry to active: only simulate
[[ ! -z $1 ]] && [[ $1 == "dry" ]] && echo -e "${GRN}run dry${NC}\n" && DRY=1

# dotfile dir
DIR=$(pwd)
PARENTDIR="$(dirname "$DIR")"
# backup dir
OLDDIR=$PARENTDIR/.dotfiles.backup

################ START ####################################

# create dotfiles_old in homedir
[[ ! -d $OLDDIR ]] && echo -e "Creating $OLDDIR for backup\n"
[[ -z $DRY ]] && mkdir -p $OLDDIR

# move any existing dotfiles backup dir and create link to dotfile
for file in $FILES; do
    if [ -f $file ] || [ -d $file ]; then
        if [ -L ~/.$file ]; then
            echo -e "${YEL}$file link already exists${NC}"
        else
            [[ -f ~/.$file ]] || [[ -d ~/.$file ]] && echo "Move ~./$file to $OLDDIR"
            [[ -z $DRY ]] && { [ -f ~/.$file ] || [ -d ~/.$file ]; } && mv ~/.$file $OLDDIR/ && echo -e "${GRN}~/.$file moved${NC}"
            echo "Create link ~/.$file to $DIR/$file"
            [[ -z $DRY ]] && ln -s $DIR/$file ~/.$file && echo -e "${GRN}Link ~/.$file created${NC}"
            echo
        fi
    else
        echo -e "${RED}$file not in $DIR${NC}"
        echo
    fi
done
