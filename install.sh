#!/bin/sh

APT_REQUIEREMENTS="tmux neovim python3 python3-pip powerline fonts-powerline"
PIP_REQUIEREMENTS="neovim"

#Do all sort of stuff...

sudo apt -y install $APT_REQUIEREMENTS
pip3 install $PIP_REQUIEREMENTS

cp ./tmux.conf ~/.tmux.conf
cp ./tmuxtheme ~/.tmux_theme

mkdir -p ~/.config/nvim/
cp ./config.vim ~/.config/nvim/init.vim

#Install Vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

nvim --headless +PlugInstall +qa
