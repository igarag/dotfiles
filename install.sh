# Installs many programs that I use in my daily 
# life as well as the configuration of programs such as vim, bash, etc.

sudo apt install curl
sudo apt install -y vim-gnome


mv ~/.bashrc ~/.bashrc.bak
cp bashrc ~/.bashrc

mv ~/.vimrc ~/.vimrc.bak
cp vimrc ~/.vimrc


