#!/bin/bash

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
SPARK_PATH="${CONFIGURATION_FILES_PATH}/spark"
PYTHON_PATH="${CONFIGURATION_FILES_PATH}/python_package"

if [ -z $USER_NAME ]; then
  USER_NAME="consciencesai"
fi
if [ -z $ROOT_PATH ]; then
  ROOT_PATH="/home/$USER_NAME/consciencesai" 
fi
if [ -z $APT ]; then
  APT="apt"
fi

PYTHON_VERSION="3.6.x"

generate_alias(){

 sudo cp ~/.bashrc 
 
}

install_python36(){

  #sudo $APT install zlib1g-dev
  echo "*********************"
  echo "INSTALLING PYTHON ${PYTHON_VERSION}..."
  echo "*********************"
  
  #sudo rm -R /usr/bin/python3
  #sudo rm -R /usr/bin/python3.8
  #sudo rm -R /usr/bin/python3.8-config
  
  sudo $APT install software-properties-common
  sudo add-apt-repository ppa:deadsnakes/ppa
  sudo $APT update
  sudo $APT install python3.6
  echo "*********************"
  echo "PYTHON ${PYTHON_VERSION} INSTALLED!"
  echo "*********************"
  echo "*********************"
  echo " CONFIGURING PYTHON... "
  echo "*********************"
  #sudo rm /usr/bin/python3
  sudo ln -sf /usr/bin/python3.6 /usr/bin/python3
  alias python3=/usr/bin/python3.6
  alias python=/usr/bin/python3.6
  sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1

  sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 2

  sudo update-alternatives --config python3
  sudo ln -sf /usr/bin/python3.6 /usr/bin/python3
  alias python3=/usr/bin/python3.6
  alias python=/usr/bin/python3.6
  sudo $APT install python3-pip
  sudo $APT install python3-venv
  #alias pip=pip3
  python -m pip install --upgrade pip
  
}

install_python36




