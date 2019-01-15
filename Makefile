# CONFLICTS=$(stow -nv "$app" 2>&1 | awk '/\* existing target is/ {print $NF}')

#STOWCREATE=stow -n -v -t
STOWCREATE=stow -t
STOWDELETE=stow -D -t

.PHONY: all
all: stow

.PHONY: stow
stow:
	@$(STOWCREATE) ~ HOME tmux zsh git
	@$(STOWCREATE) ~ CONFIG
	@$(STOWCREATE) ~ scripts
	@$(STOWCREATE) ~ nvim
	@$(STOWCREATE) ~ vim
	@$(STOWCREATE) ~ alacritty
	@$(STOWCREATE) ~ dunst
	@$(STOWCREATE) ~ gsimplecal
	@$(STOWCREATE) ~ mutt
	@$(STOWCREATE) ~ i3
	@$(STOWCREATE) ~ polybar
	@$(STOWCREATE) ~ rofi
	@$(STOWCREATE) ~ rofi-pass
	@$(STOWCREATE) ~ sublime-text-3
	@$(STOWCREATE) ~ systemd

.PHONY: unstow
unstow:
	@$(STOWDELETE) ~ HOME tmux zsh git
	@$(STOWDELETE) ~ CONFIG
	@$(STOWDELETE) ~ nvim
	@$(STOWDELETE) ~ vim
	@$(STOWDELETE) ~ alacritty
	@$(STOWDELETE) ~ dunst
	@$(STOWDELETE) ~ gsimplecal
	@$(STOWDELETE) ~ mutt
	@$(STOWDELETE) ~ i3
	@$(STOWDELETE) ~ polybar
	@$(STOWDELETE) ~ rofi
	@$(STOWDELETE) ~ rofi-pass
	@$(STOWDELETE) ~ sublime-text-3
	@$(STOWDELETE) ~ systemd
