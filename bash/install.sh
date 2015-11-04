#!bin/bash

echo "build symbol link in ~"
# echo $PWD
rm ~/.bash_logout  ~/.bash_profile  ~/.bashrc
ln -s $PWD/.bash_logout ~/.bash_logout
ln -s $PWD/.bash_profile ~/.bash_profile
ln -s $PWD/.bashrc ~/.bashrc
