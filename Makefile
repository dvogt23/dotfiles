#STOWCREATE=stow -n -v -t
STOWCREATE=stow -t
STOWDELETE=stow -D -t
MAKEFILE=./make.sh

.PHONY: all
all: packages stow

.PHONY: dotfiles
dotfiles: stow

.PHONY: packages
packages:
	@$(MAKEFILE) packages
	@$(MAKEFILE) cargo

.PHONY: stow
stow:
	@$(MAKEFILE) dotfiles

.PHONY: unstow
unstow:
	@$(STOWDELETE) ~ */
