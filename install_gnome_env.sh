#!/bin/sh
set -e
APT_EXT="xinput synclient"
sudo pip3 install gnome-extensions-cli

echo $PROGRESS "Setting background"
cp ./background_img.jpg $STATIC_FILES_DIR/bck.jpg
echo -e "[/]\npicture-options='zoom'\npicture-uri='file://$STATIC_FILES_DIR/bck.jpg'" | dconf load /org/gnome/desktop/background/

echo $PROGRESS "Installing gnome-shell extensions"
sudo apt -y install $APT_EXT
gnome-extensions-cli install 517 307 906 1401 427 841 355 904 131 1276 744
cat extensions_dconf_configuration | dconf load /org/gnome/shell/extensions/
