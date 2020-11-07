#!/bin/bash
export PROGRESS='-e \n[*]'
export LISTEL="-e \n---"
export QUESTION='-e \n\n??>'

ask_question(){
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

ask_question "Install tmux and neovim configuration ?"
INSTALL_TMUX_NVIM=$?
ask_question "Install gnome desktop environment ?"
INSTALL_GNOME_ENV=$?
ask_question "Install additional softwares ?"
INSTALL_ADD_SOFT=$?
ask_question "Install personnal utilities ?"
INSTALL_PERS_UTILITIES=$?
ask_question "Install infosec utilities ?"
INSTALL_INFOSEC_UTILITIES=$?

set -e

if [[ ! -v $STATIC_FILES_DIR ]];then
    export STATIC_FILES_DIR=/usr/share/systemsetup
fi
sudo mkdir -p $STATIC_FILES_DIR

APT_REQ="git curl python3-pip"

echo "[*] Updating system"
sudo apt update && sudo apt upgrade

echo "[*] Installing dependencies"
sudo apt -y install $APT_REQ

if [ $INSTALL_TMUX_NVIM -eq 1 ] ; then
    echo $INFO "Installing tmux and neovim environment"
    bash ./install_tmux_neovim_env.sh
fi

if [ $INSTALL_GNOME_ENV -eq 1 ] ; then
    echo $INFO "Installing gnome desktop environment"
    bash ./install_gnome_env.sh
fi

if [ $INSTALL_ADD_SOFT -eq 1 ] ; then
    echo $INFO "Installing additionnal software environment"
    bash ./install_additional_softwares.sh
fi

if [ $INSTALL_PERS_UTILITIES -eq 1 ] ; then
    echo $INFO "Installing personnal utilities"
    bash ./install_personnal_utilities.sh
fi

if [ $INSTALL_INFOSEC_UTILITIES -eq 1 ] ; then
    echo $INFO "Installing Infosec utilities"
    bash ./install_infosec_utilities.sh
fi
