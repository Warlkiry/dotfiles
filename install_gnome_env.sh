#!/bin/sh

set -e

set_theme_opt(){
    cmd=$(echo "dconf write /org/gnome/desktop/interface/$1 '$2'")
    echo $cmd
    $cmd
}

APT_EXT="xinput lm-sensors"
sudo pip3 install gnome-extensions-cli

echo $PROGRESS "Setting background"
sudo cp ./background_img.jpg $STATIC_FILES_DIR/bck.jpg
echo -e "[/]\npicture-options='zoom'\npicture-uri='file://$STATIC_FILES_DIR/bck.jpg'"|dconf load /org/gnome/desktop/background/
echo -e "[/]\npicture-uri='file://$STATIC_FILES_DIR/bck.jpg'"|dconf load /org/gnome/desktop/screensaver/

echo $PROGRESS "Installing gnome-shell extensions"
sudo apt -y install $APT_EXT


gnome-extensions-cli install $(cat ./extensions_list | cut -d '/' -f 2 | awk '{ printf "%s ", $0 }')

cat extensions_dconf_configuration | dconf load /org/gnome/shell/extensions/

rm -rf ~/.themes/gtk_default_systemsetup ~/.icons/cursor_default_systemsetup ~/.local/share/icons/icon_default_systemsetup
cp -r ./gtk_default_systemsetup ~/.themes/
cp -r ./cursor_default_systemsetup ~/.icons/
cp -r ./icon_default_systemsetup ~/.local/share/icons/

set_theme_opt 'gtk-theme' 'gtk_default_systemsetup'
set_theme_opt 'icon-theme' 'icon_default_systemsetup'
set_theme_opt 'cursor-theme' 'cursor_default_systemsetup'
set_theme_opt 'clock-show-seconds' 'true'
set_theme_opt 'clock-show-weekday' 'true'
set_theme_opt 'enable-animations' 'true'
set_theme_opt 'enable-hot-corners' 'false'
set_theme_opt 'show-battery-percentage' 'false'

gsettings set org.gnome.shell.extensions.dash-to-dock show-show-apps-button true
cat dconf_dash_to_dock | dconf load /org/gnome/shell/extensions/dash-to-dock/
