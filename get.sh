#!/usr/bin/env bash
set -ex

# create and go to a temp folder
D=$(mktemp -d)
cd $D

platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
    # install required packages via custom ppas
    sudo apt-get update
    sudo apt-get install -y ansible curl unzip fish
elif [[ "$unamestr" == 'Darwin' ]]; then
    brew update
    brew install ansible curl unzip fish
fi

# download and execute shell setup playbook
curl -L https://github.com/rettier/shell/archive/master.zip -o shell.zip 
unzip shell.zip 
cd shell-master 
python3 -m venv ~/.virtualenvs/virtualfish
ansible-playbook ~/git/shell/install.yml

# remove temp folder
cd ~ 
rm -rf $D 

# start fish
fish
