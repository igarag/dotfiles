# Installs many programs that I use in my daily 
# life as well as the configuration of programs such as vim, ranger, etc.

HOME=$( getent passwd "$USER" | cut -d: -f6 )
RANGER_PATH=$HOME/.config/ranger
TERMINATOR_PATH=$HOME/.config/terminator

sudo apt install curl
sudo apt install -y vim-gnome

### bashrc
mv ~/.bashrc ~/.bashrc.bak
cp bashrc ~/.bashrc

### vimrc
mv ~/.vimrc ~/.vimrc.bak
cp vimrc ~/.vimrc

### ranger
if [ -d "$RANGER_PATH" ];
then
    sudo apt install ranger
    sudo apt install feh
fi
cp rc.conf $RANGER_PATH/

# terminator
if [ -d "$TERMINATOR_PATH" ];
then
    sudo apt install terminator
fi
mv $TERMINATOR_PATH/config $TERMINATOR_PATH/config.bak
cp config $TERMINATOR_PATH/


## Install virtualenvs
sudo apt-get install build-essential libssl-dev libffi-dev python-dev
sudo add-apt-repository ppa:linuxuprising/apps






