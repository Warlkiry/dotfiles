#!/bin/sh

set -e 

echo $PROGRESS "Installing alacritty"

sudo apt -y install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup override set stable
rustup update stable

export PATH=$HOME/.cargo/bin/:$PATH
echo 'export PATH=$HOME/.cargo/bin/:$PATH' >> $HOME/.bashrc
cd $STATIC_FILES_DIR
sudo rm -rf alacritty
sudo git clone https://github.com/alacritty/alacritty && cd alacritty
cargo_path=$(which cargo)
sudo $cargo_path build --release

sudo cp target/release/alacritty /usr/local/bin
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

sudo mkdir -p /usr/local/share/man/man1
gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null

mkdir -p ~/.bash_completion
cp extra/completions/alacritty.bash ~/.bash_completion/alacritty
echo "source ~/.bash_completion/alacritty" >> ~/.bashrc

cp ./alacritty_config.yml $HOME/.alacritty.yml
