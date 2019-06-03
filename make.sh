#!/usr/bin/env bash

# install packages and deploy dotfiles
# backup conflicting dotfiles

PACMAN=/usr/bin/yay
PACKAGES_FILE=packages.pacman
BACKUP_DIR=~/.dotfiles.backup
SUDO=/usr/bin/sudo
GIT=/usr/bin/git
MAKEPKG=/usr/bin/makepkg

install_packages() {
    # install packages
    # get sudo
    $SUDO -v

    # sudo keep alive
    while true; do $SUDO -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

    # install yay
    if ! pacman -Q yay-bin &> /dev/null ; then
        echo -e "\n# Installing AUR helper 'yay'..."
        dir=$(pwd)
        cd "$(mktemp -d)" || exit 1;
        $GIT clone https://aur.archlinux.org/yay-bin.git
        cd yay-bin || exit 1;
        $MAKEPKG -si --noconfirm
        cd ..
        rm -rf yay-bin
        cd "$dir" || exit 1;
        echo -e "AUR Helper 'yay' successfully installed\n"
    fi

    [ ! -f "${PACKAGES_FILE}" ] || echo "# Install packages from ${PACKAGES_FILE}"
    for package in $( ! test -f "${PACKAGES_FILE}" || cat "${PACKAGES_FILE}"); do
        ${PACMAN} -S "${package}" --needed --noconfirm
    done
}

link_files() {
    # backup dotfiles
    IFS=$'\n'
    for file in $(stow -n */ 2>&1 | grep -v 'WARNING' | grep -oE ":.+" | cut -c3-); do
        echo "# Backing up conflicts to ${BACKUP_DIR}"
        mkdir -p ${BACKUP_DIR}/"$(dirname "${file}")"
        mv ~/"${file}" ${BACKUP_DIR}/"${file}"
        echo " ✔ ${file}"
    done

    # create symlinks
    echo "# Linking dotfiles..."
    stow */
    echo " ✔ done"
}

print_help() {
usage="$(basename "$0") [-h] [packages] [dotfiles]

help:
    packages    install packages
    dotfiles    link dotfiles
    help        print this help"
    echo "${usage}"
}

# check arguments
while test $# -gt 0
do
    case "$1" in
        packages) install_packages
            ;;
        dotfiles) link_files
            ;;
        help|-h) print_help
            ;;
        *) echo "invalid argument: $1"
            print_help
            ;;
    esac
    shift
done

exit 0
