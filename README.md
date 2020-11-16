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

- [Ruby colorls](https://www.omgubuntu.co.uk/2017/07/add-bling-ls-bash-command-colorls).

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

## Programs

- [Rofi](https://github.com/davatorium/rofi)
- Flameshot

## NeoVim + Python

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

## How to use vim-plug

You can execute following command in Nvim comand mode:

- Install plugins：`:PlugInstall`
- Update plugins：`:PlugUpdate`
- Remove plugins：`:PlugClean` (First, comment the plugin install command in `init.vim`. Open Nvim and use `:PlugClean` to uninstall plugins)
- Check the plugin status：`:PlugStatus`
- Upgrade vim-plug itself：`:PlugUpgrade`