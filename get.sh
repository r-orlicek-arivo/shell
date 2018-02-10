#!/bin/sh
D=$(mktemp -d)
cd $D >/dev/null
sudo apt-get update >/dev/null
sudo apt-get install ansible curl unzip >/dev/null
curl -L https://github.com/rettier/shell/archive/master.zip -o shell.zip >/dev/null
unzip shell.zip >/dev/null
cd shell-master >/dev/null
ansible-playbook install.yml
cd ~ >/dev/null
rm -rf $D >/dev/null
fish