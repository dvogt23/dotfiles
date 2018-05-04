#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Update App Store apps
sudo softwareupdate -i -a

# Update Homebrew (Cask) & packages
brew update
brew upgrade

# Update npm & packages
npm install npm -g
npm update -g

# Update Ruby & gems
sudo gem update —system
sudo gem update

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew tap homebrew/versions
brew install bash-completion2

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
brew install homebrew/php/php56 --with-gmp

# Install other useful binaries.
brew install dark-mode
brew install git
brew install git-lfs
brew install p7zip
brew install pigz
brew install rename
brew install speedtest_cli
brew install ssh-copy-id
brew install tree

brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions

brew cask install atom
brew cask install dropbox
brew cask install spotify
brew cask install sublime-text3
brew cask install virtualbox
brew cask install vlc
brew cask install flux
# Remove outdated versions from the cellar.
brew cleanup
