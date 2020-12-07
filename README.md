# My Dotfiles
This repository presents configuration about the following programs:

- Vim (code editor)

- Neovim (code editor)

- Ranger (file manager)

- bspwm (window tiling manager)

- sxhkd (shortcuts)

- [Polybar](https://github.com/polybar/polybar)

- [Suckless](https://suckless.org/)

- Devhints: alias to return information about a library (hints) using [rich](https://github.com/willmcgugan/rich) Python library

- [zsh (ohmyzsh)](https://github.com/ohmyzsh/ohmyzsh)

- [powerlevel10k](https://github.com/romkatv/powerlevel10k)

- [ctop](https://github.com/bcicen/ctop)

  

### Tiling window manager resources

Other libraries for customization:

- [pywal](https://github.com/dylanaraps/pywal/wiki/Installation)
- bspwm
- [i3-gaps](https://github.com/pasiegel/i3-gaps-install-ubuntu) - [i3-gaps-ref-2](https://github.com/Airblader/i3)
- Multimonitor: [mons](https://github.com/Ventto/mons)

## zsh

Plugins:

- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)

- zsh-autosuggestions

  ```bash
  git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/zsh-autosuggestions
  source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
  ```

  

## Programs

- [Rofi](https://github.com/davatorium/rofi)
- Flameshot
- [LazyGit](https://github.com/jesseduffield/lazygit)
- [BatCat](https://github.com/sharkdp/bat)
- [colorls](https://github.com/athityakumar/colorls#installation)

## Rofi

Install Rofi vía apt:

```bash
sudo apt install rofi
```

Add the following command to your custom shortcuts.

- Run programs:

  ```bash
  rofi -show drun -show-icons
  ```

- Show windows

    ```bash
    rofi -show window -show-icons
    ```

Copy the `photon-orange.rasi` theme to `/usr/share/rofi/themes`.

## NeoVim + Python

### Install NeoVim

Download de [appimage](https://github.com/neovim/neovim/releases) and move it into:

```bash
sudo mv /tmp/nvim.appimage /usr/local/bin/nvim
chmod +x /usr/local/bin/nvim
```

Extensions:

- fzf
- Denite
- CoC

Create file:

```bash
~/.config/nvim/init.vim
```

1. Install vim-plug itself:

   ```bash
   curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   ```

2. Edit `init.vim` and add the configuration for vim-plug. Sample:

   ```bash
   call plug#begin('~/.local/share/nvim/plugged')
   Plug 'davidhalter/jedi-vim'
   call plug#end()
   ```



### FZF

Install using:

```bash
sudo apt install fzf
```

| Command | Use                                                          |
| ------- | ------------------------------------------------------------ |
| :BLines | Search patterns in one file. Return the lines contained in the pattern. |
| :FZF    | Search files                                                 |
|         |                                                              |

### FZF in terminal

| Shortcut           | Use                               |
| ------------------ | --------------------------------- |
| `<C-R>` (Ctrl + R) | History                           |
| Alt + C            | Folders inside of `.git` projects |
| `<C-T>` (Ctrl + T) | Find files                        |



### Startify

Commands to use in startify

| Command    | Use             |
| ---------  | --------------  |
| :SLoad     | load a session  |
| :SSave[!]  | save a session  |
| :SDelete[!]| delete a session|
| :SClose    | close a session |







|         |          |
| ------- | -------- |
| `<M-j>` | M is Alt |
|         |          |
|         |          |



## How to use vim-plug

You can execute following command in Nvim comand mode:

- Install plugins：`:PlugInstall`
- Update plugins：`:PlugUpdate`
- Remove plugins：`:PlugClean` (First, comment the plugin install command in `init.vim`. Open Nvim and use `:PlugClean` to uninstall plugins)
- Check the plugin status：`:PlugStatus`
- Upgrade vim-plug itself：`:PlugUpgrade`
- Reload config file: `:so %`