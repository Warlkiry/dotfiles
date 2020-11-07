#!/bin/sh
set -e
APT_SOFT="tmux neovim python3 python3-pip powerline fonts-powerline"
PIP_SOFT="neovim"
sudo apt -y install $APT_SOFT
sudo pip3 install $PIP_SOFT

echo $PROGRESS "Configuring tmux"
echo "source-file $STATIC_FILES_DIR/tmux_theme" >> ./tmux.conf
sudo cp ./tmuxtheme $STATIC_FILES_DIR/tmux_theme
sudo cp ./tmux.conf /etc/tmux.conf

echo $PROGRESS "Configuring neovim"
sudo cp ./config.vim /usr/share/nvim/sysinit.vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim --headless +PlugInstall +qa


