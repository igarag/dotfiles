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

### Startify

Commands to use in startify

| Command     | Use              |
| ----------- | ---------------- |
| :SLoad      | load a session   |
| :SSave[!]   | save a session   |
| :SDelete[!] | delete a session |
| :SClose     | close a session  |

## How to use vim-plug

You can execute following command in Nvim comand mode:

- Install plugins：`:PlugInstall`
- Update plugins：`:PlugUpdate`
- Remove plugins：`:PlugClean` (First, comment the plugin install command in `init.vim`. Open Nvim and use `:PlugClean` to uninstall plugins)
- Check the plugin status：`:PlugStatus`
- Upgrade vim-plug itself：`:PlugUpgrade`
- Reload config file: `:so %`