#!/bin/bash
export PROGRESS='-e \n[*]'
export LISTEL="-e \n---"
export QUESTION='-e \n\n??>'

if [[ ! -v $STATIC_FILES_DIR ]];then
    export STATIC_FILES_DIR=/usr/share/systemsetup
fi

install_target(){
    clear
    if [ $1 -eq 1 ] ; then
        echo $INFO "Installing $(echo $3 | sed 's/_/ /')"
        bash ./$2
        echo "$3" | sudo tee -a $STATIC_FILES_DIR/installed
    fi
}

ask_question(){
    if [ -f $STATIC_FILES_DIR/installed ] ; then
        if [ ! -z $(cat $STATIC_FILES_DIR/installed | grep $2) ] ; then
            return 0;
        fi
    fi
    echo $QUESTION $1
    select result in Yes No cancel
    do
        break
    done
    case $result in
        Yes)
            return 1;
            ;;
        No)
            return 0;
            ;;
        cancel)
            exit 0;
            ;;
        *)
            exit 1;
            ;;
    esac
}

ask_question "Install tmux and neovim configuration ?" "tmux_and_nvim"
INSTALL_TMUX_NVIM=$?
ask_question "Install gnome desktop environment ?" "gnome_desktop_env"
INSTALL_GNOME_ENV=$?
ask_question "Install additional softwares ?" "additionnal_software"
INSTALL_ADD_SOFT=$?
ask_question "Install personnal utilities ?" "personnal_utilities"
INSTALL_PERS_UTILITIES=$?
ask_question "Install infosec utilities ?" "infosec_utilities"
INSTALL_INFOSEC_UTILITIES=$?
# echo $INSTALL_TMUX_NVIM $INSTALL_GNOME_ENV $INSTALL_ADD_SOFT $INSTALL_PERS_UTILITIES $INSTALL_INFOSEC_UTILITIES

clear
set -e
sudo mkdir -p $STATIC_FILES_DIR
APT_REQ="git curl python3-pip"

echo $PROGRESS "Updating system"
sudo apt update && sudo apt upgrade

echo $PROGRESS "Installing dependencies"
sudo apt -y install $APT_REQ

install_target $INSTALL_TMUX_NVIM "./install_tmux_neovim_env.sh" "tmux_and_nvim"
install_target $INSTALL_GNOME_ENV "./install_gnome_env.sh" "gnome_desktop_env"
install_target $INSTALL_ADD_SOFT "./install_gnome_env.sh" "additionnal_software"
install_target $INSTALL_PERS_UTILITIES "./install_personnal_utilities.sh" "personnal_utilities"
install_target $INSTALL_INFOSEC_UTILITIES "./install_infosec_utilities.sh" "infosec_utilities"

clear
echo "System ready"
