#!/bin/sh
set -e
echo $PROGRESS "Adding new repositories ..."
wget -q https://repo.skype.com/data/SKYPE-GPG-KEY -O- | sudo apt-key add -
wget -O- https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
echo "deb [arch=amd64] https://repo.skype.com/deb stable main" | sudo tee /etc/apt/sources.list.d/skypeforlinux.list
sudo apt update

echo $PROGRESS "Installing softwares"
sudo apt -y install $(awk '{ printf "%s ", $0 }' software_list)


