# Functions

function mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
function trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
function ql () { qlmanage -p "$*" >& /dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview

function chpwd() {
    emulate -L zsh
    ls -a
}

function swap()         
{
    local TMPFILE=tmp.$$
    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}
