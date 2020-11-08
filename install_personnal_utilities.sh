#!/bin/sh
set -e

GITURL="https://github.com"
setup_link(){
    sudo rm -f /usr/bin/$2
    sudo chmod +x $PWD/$1
    sudo ln -s $PWD/$1 /usr/bin/$2
}

prepare_tool(){
    clear
    echo $LISTEL $1
    cd $STATIC_FILES_DIR
    sudo rm -rf $1
    sudo git clone $GITURL/$2/$1/
    cd $1
}

echo "#!/bin/bash
STATIC_FILES_DIR=$STATIC_FILES_DIR" | sudo tee $STATIC_FILES_DIR/update_custom_tools
cat ./update_custom_tools.sh | sudo tee -a $STATIC_FILES_DIR/update_custom_tools
cd $STATIC_FILES_DIR
setup_link "update_custom_tools" "update_custom_tools"

prepare_tool "CantReadTh1s" "litchipi"

sudo pip3 install -U cryptography argon2 lz4
sudo python3 ./setup.py install

setup_link "cli.py" "cantreadth1s"

# ADD NEW TOOL:     add to update_custom_tools.sh too !!!
