#/bin/bash

dir=~/.dotfiles
olddir=~/.dotfiles.backup
files="bash_profile gitattirbutes gitconfig gitignore gitattributes hushlogin vim vimrc"

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving $file to $olddir"
    mv ~/.$file ~/$olddir/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done