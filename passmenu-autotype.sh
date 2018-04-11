#!/usr/bin/env bash

shopt -s nullglob globstar

typeit=0 hasuserfield=0
opts="$(getopt -l typeit,userfield: -n 'passmenu' -- '$@')"

while true; do case $1 in
	--type) typeit=1; shift ;;
	--userfield) hasuserfield=1; userfield="${2:-1}"; shift 2 ;;
	*) break ;;
esac done

prefix=${PASSWORD_STORE_DIR-~/.password-store}
password_files=( "$prefix"/**/*.gpg )
password_files=( "${password_files[@]#"$prefix"/}" )
password_files=( "${password_files[@]%.gpg}" )

password=$(printf '%s\n' "${password_files[@]}" | dmenu "$@")

[[ -n $password ]] || exit

if [[ $typeit -eq 0 ]]; then
	pass show -c "$password" 2>/dev/null
elif [[ $hasuserfield -ne 0 ]]; then
	pass show "$password" | { read -r pass ; read -r -d '' rest; echo "$rest" | sed -n "s/${userfield}:\s\?\(.*\)/\1/p" | xargs -i printf  '%s\t%s\n' {} "$pass"; }  |
		xdotool type --clearmodifiers --file -
else
	pass show "$password" | { read -r pass; printf %s "$pass"; } |
		xdotool type --clearmodifiers --file -
fi
