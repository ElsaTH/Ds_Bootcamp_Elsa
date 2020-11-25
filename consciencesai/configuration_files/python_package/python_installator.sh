#!/bin/bash
# Author: Gabriel Vázquez Torres | ConsciencesAI
#https://www.tecmint.com/install-python-in-linux/

#sudo apt autoremove python
#sudo apt autoremove python3

#sudo apt install build-essential checkinstall
#sudo apt install libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev

# Remove pip3
# sudo apt-get --purge autoremove python3-pip
# sudo python3 -m pip uninstall pip

# https://askubuntu.com/questions/969463/python3-pip3-install-broken-on-ubuntu

USER_NAME=$1 
ROOT_PATH=$2
APT=$3

CONFIGURATION_FILES_PATH="configuration_files"
PYTHON_PATH="${CONFIGURATION_FILES_PATH}/python_package"


echo "$USER_NAME"
echo "$ROOT_PATH"
echo "$APT"

PYTHON_VERSION="3.6.x"

generate_alias(){

 sudo cp ~/.bashrc 
 
}

install_python2_yum(){

  echo "*********************"
  echo "UPDATING/INSTALLING PYTHON PYTHON 2 and 3..."
  echo "*********************"

  echo "*********************"
  echo " CONFIGURING PYTHON 2 and 3... "
  echo "*********************" 

  ### PIP
  sudo $APT install -y python-pip
  sudo $APT install -y python3
  alias python3="/usr/bin/python3"
  
  alias pip="python -m pip"
  alias pip3="python3 -m pip"
  sudo python -m pip install --upgrade pip
  sudo python -m pip install virtualenv
  sudo python3 -m pip install --upgrade pip
  sudo python3 -m pip install virtualenv
  echo "*********************"
  echo " PYTHON 2 and 3 CONFIGURED "
  echo "*********************" 
}

if [[ $APT="yum" ]]; then
  install_python2_yum
else
  install_python36_apt
fi




