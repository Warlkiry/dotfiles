#!/bin/sh
set -e
echo $LISTEL "CantReadTh1s"
cd $STATIC_FILES_DIR
git clone https://github.com/litchipi/CantReadTh1s/
cd CantReadTh1s
sudo pip3 install -U cryptography argon2 lz4
sudo python3 ./setup.py install
sudo ln -s ./cli.py /usr/bin/cantreadth1s

#   HOME SWEET HOME
cd $STATIC_FILES_DIR

#   Other installation scripts

