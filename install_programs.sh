#!/bin/bash

###############
### FLATPAK ###
###############

# Lista de aplicaciones Flatpak a instalar desde Flathub
APPS=(
    org.videolan.VLC                  # VLC Media Player
    org.libreoffice.LibreOffice       # LibreOffice Suite
    org.localsend.localsend_app       # LocalSend - File sharing
    org.flameshot.Flameshot           # Flameshot - Screenshot tool
    com.vscodium.codium               # VSCodium - Code editor
    com.transmissionbt.Transmission   # Transmission - Torrent client
    nl.hjdskes.gcolor3                # Gcolor3 - Color picker
    com.getmailspring.Mailspring      # Mailspring - Mail client
    io.freetubeapp.FreeTube           # Freetube - Open source YouTube client
    com.spotify.Client                # Spotify - Official Spotify client
    org.keepassxc.KeePassXC           # KeePassXC - Password manager
    com.brave.Browser                 # BraveBrowser - Free ads browser
    org.telegram.desktop              # Telegram - Desktop messaging app
    com.github.qarmin.czkawka         # Czkawka - Multi functional app to find duplicates
)

echo "🔧 Installing Flatpak applications from Flathub..."

flatpak install -y flathub "${APPS[@]}"

echo "✅ Installation complete."


###########
### ZSH ###
###########
# Install ZSH
sudo apt install zsh

# Set as default
chsh -s $(which zsh)

# Plugins
mkdir -p ~/.zsh/plugins

# Autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#manual-git-clone
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/plugins/zsh-autosuggestions

# Syntax hightlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/plugins/zsh-syntax-highlighting

# Z-plugin
mkdir -p ~/.zsh/plugins/zsh-z
git clone https://github.com/agkozak/zsh-z.git ~/.zsh/plugins/zsh-z

# Auto autoswitch-virtualenv
mkdir -p ~/.zsh/plugins/autoswitch_virtualenv
git clone https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv.git ~/.zsh/plugins/autoswitch_virtualenv


# Restart zsh


############
### RUST ###
############

# Install Rust core
curl https://sh.rustup.rs -sSf | sh

# Libraries
libraries=(
  "starship"
  "dust"
  "lsd"
)

for lib in "${libraries[@]}"; do
    cargo install "$lib" --locked
done
