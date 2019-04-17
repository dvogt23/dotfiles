
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

##### License

This project is licensed under the MIT License - see the LICENSE.md file for details
