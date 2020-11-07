#!/bin/sh
set -e

GITURL=https://github.com/litchipi


APT_SOFT="nmap tshark sqlmap crunch hashcat aircrack-ng radare2 set binwalk"
sudo apt -y install $APT_REQ $APT_SOFT
#sudo pip3 install $PIP_REQ


echo $LISTEL "Bers3rk"
cd $STATIC_FILES_DIR
git clone $GITURL/Bers3rk/
cd Bers3rk
sudo python3 ./setup.py install

echo $LISTEL "SniffSnoof"
cd $STATIC_FILES_DIR
git clone $GITURL/SniffSnoof/
cd SniffSnoof
sudo ln -s ./sniffsnoof /usr/bin/sniffsnoof
