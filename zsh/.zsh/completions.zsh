# fuzzy multi-select modified file
gfmod() {
  git ls-files -m | fzf -m
}

# stage files multi-selected modified files
gfadd() {
  git add $(gfmod)
}

# pass completion suggested by @d4ndo (#362)
_fzf_complete_pass() {
  _fzf_complete '+m' "$@" < <(
    pwdir=${PASSWORD_STORE_DIR-~/.password-store/}
    stringsize="${#pwdir}"
        fd .gpg "$pwdir" |
        cut -c "$((stringsize + 1))"-  |
        sed -e 's/\(.*\)\.gpg/\1/'
    )
}

[ -n "$BASH"  ] && complete -F _fzf_complete_pass -o default -o bashdefault pass

