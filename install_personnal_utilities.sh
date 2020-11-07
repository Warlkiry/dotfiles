#!/bin/sh
set -e

GITURL="https://github.com"
setup_link(){
    sudo rm /usr/bin/$2
    sudo ln -s $PWD/$1 /usr/bin/cantreadth1s
}

prepare_tool(){
    echo $LISTEL $1
    cd $STATIC_FILES_DIR
    sudo rm -rf $1
    sudo git clone $GITURL/$2/$1/
    cd $1
}

prepare_tool "CantReadTh1s" "litchipi"

sudo pip3 install -U cryptography argon2 lz4
sudo python3 ./setup.py install

setup_link "cli.py" "cantreadth1s"

#   HOME SWEET HOME

#   Other installation scripts

