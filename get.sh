#!/bin/sh
set -ex

# create and go to a temp folder
D=$(mktemp -d)
cd $D

# install required packages via custom ppas
sudo apt-get update
sudo apt-get install -y software-properties-common
sudo apt-add-repository ppa:fish-shell/release-2
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update 
sudo apt-get install -y ansible curl unzip fish

# download and execute shell setup playbook
curl -L https://github.com/rettier/shell/archive/master.zip -o shell.zip 
unzip shell.zip 
cd shell-master 
ansible-playbook install.yml

# remove temp folder
cd ~ 
rm -rf $D 

# start fish
fish
