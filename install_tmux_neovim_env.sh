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

#       IDE COMMANDS
#           <leader>f   Go to declaration
#           <leader>&   Documentation

echo $PROGRESS "Configuring neovim"

cp ./common_vimplugs ./vim_plugs
cp ./common_config.vim ./config.vim

#TODO   Fix neovim configuration & plugin installation system wide (for root too)
echo -e "call plug#begin()\n$(cat ./vim_plugs)\ncall plug#end()\n$(cat ./config.vim)" > ./config.vim

sudo mv ./config.vim /usr/share/nvim/sysinit.vim
rm ./vim_plugs
sudo wget 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' -O /usr/share/nvim/runtime/autoload/plug.vim
nvim --headless +PlugInstall +qa

