
### My .dotfiles, my bashlife!
---
##### Summary
| OS       | Arch Linux x86_64 |
| -------- | ----------------- |
| Shell    | [zsh](https://github.com/zsh-users/zsh)          |
| WM       | [i3-gaps](https://github.com/Airblader/i3)           |
| Theme    | Arc-Dark [GTK2/3] |
| Icons    | Adwaita [GTK2/3]  |
| Terminal | [alacritty](https://github.com/jwilm/alacritty)        |
| Font     | [Iosevka](https://be5invis.github.io/Iosevka/)           |
---
##### Screenshot
![Screenshot][screenshot]

[screenshot]: screenshot.png "Screenshot"

##### Prerequisites
Install all packages from `packages.pacman` with:

    make packages

##### Link all dotfiles
Create symlinks for all dotfiles with GNU/`stow` will create a backup dir with 
conflicting files:

    make dotfiles

##### Git config
Create your own `.gitconfig.local` that would include to the `.gitconfig`

Where `~/.gitconfig.local` is simply:

    [user]
      name = <your_name>
      email = <your_email>

#### NVIM

##### Keybindings

The primary keybindings for nvim:

*UI*:
 - Leader key:   `<SPACE>` & `\`
 - ESC keys:     `jj`, `jk`, `<ESC>`
 - Quit:         `<LEADER>q`

 - File expl:    `<LEADER>n`
 - Search file:  `<LEADER>f`
 - Search string:`<LEADER>r`
 - Term:         `<LEADER>t`
 - Commands:     `<LEADER>c`

*Split:*
  - Switch:   `<C-h, -j, -k, -l>`
  - Resize:   `<A-Right, -Left, -Up, -Down>`

*Edit*:
  - Move line:  v`K/H`
  - Move char:  n`H/L`

*Buffer*:
  - Close:    `<LEADER>d`
  - Next:     `<LEADER>l`
  - Previos:  `<LEADER>h`
  - Save:     `<LEADER>w`
  - Fuzzy:    `<LEADER>b`

*LSP*:
  - Goto definition:      `gd`
  - Goto implementation:  `gi`
  - References:           `gr`
  - Type definition:      `gt`
  - Quick fix:            `<LEADER>lq`
  - Action:               `<LEADER>la`
  - Diagnostic:           `<LEADER>ld`
  - Diag. next:           `<LEADER>ldn`
  - Diag. prev:           `<LEADER>ldp`
  - Reformat file:        `<LEADER>lff`
  - Reformat visual:      `<LEADER>lf`
  - Buffer rename:        `<LEADER>lrn`
  - Show doc:        	  `K`
  - Show signature:       `<C-k>`

*Git*:
  - Add hunk:             `<LEADER>gha`
  - Revert hunk:          `<LEADER>ghr`
  - Diff hunk:            `<LEADER>ghd`
  - Status:               `<LEADER>gs`
  - Blame:                `<LEADER>gb`
  - History:              `<LEADER>gl`
  - Log file:             `<LEADER>glf`

##### License

This project is licensed under the MIT License - see the LICENSE.md file for details

