#!/bin/sh
set -e
APT_SOFT="tmux neovim python3 python3-pip powerline fonts-powerline"
PIP_SOFT="neovim"
sudo apt -y install $APT_SOFT
sudo pip3 install $PIP_SOFT

echo $PROGRESS "Configuring tmux"
sudo cp ./tmuxtheme $STATIC_FILES_DIR/tmux_theme
sudo cp ./tmux.conf /etc/tmux.conf
echo "source-file $STATIC_FILES_DIR/tmux_theme" | sudo tee -a /etc/tmux.conf

echo $PROGRESS "Configuring neovim"
#TODO   Fix neovim configuration & plugin installation system wide (for root too)
sudo cp ./config.vim /usr/share/nvim/sysinit.vim
sudo wget 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' -O /etc/vim/autoload/plug.vim
nvim --headless +PlugInstall +qa
