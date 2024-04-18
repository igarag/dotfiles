# Tmux
sudo pacman -S tmux

# Powelevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install


### APPLICATIONS

# yay
yay -S typora
yay -S mailspring
yay -S anytype-bin
yay -S slack-desktop
yay -S vscodium-bin

# pacman
sudo pacman -Sy pycharm-community-edition
sudo pacman -Sy nvim
sudo pacman -Sy alacritty
sudo pacman -Sy telegram-desktop
sudo pacman -Sy gimp
sudo pacman -Syu spotify-launcher
sudo pacman -Syu brave-browser


# TUI tools
sudo pacman -S lazygit
sudo pacman -S lazydocker

