#STATIC_FILES_DIR will be dynamically added on installation here
set -e

setup_link(){
    sudo rm -f /usr/bin/$2
    sudo chmod +x $PWD/$1
    sudo ln -s $PWD/$1 /usr/bin/$2
}

get_updates(){
    echo $LISTEL "Updating $1"
    cd $STATIC_FILES_DIR/$1
    sudo git pull
}

get_updates "CantReadTh1s"
sudo python3 ./setup.py install
setup_link "cli.py" "cantreadth1s"
