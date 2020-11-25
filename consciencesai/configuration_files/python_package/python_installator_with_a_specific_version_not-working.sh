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

# Multiple versions Ubuntu
# https://hackersandslackers.com/multiple-versions-python-ubuntu/

USER_NAME=$1 
ROOT_PATH=$2
APT=$3


if [ -z $USER_NAME ]; then
  USER_NAME="consciencesai"
fi
if [ -z $ROOT_PATH ]; then
  ROOT_PATH="/home/$USER_NAME/consciencesai" 
fi
if [ -z $APT ]; then
  APT="apt"
fi

PYTHON_VERSION="3.6.8"

generate_alias(){

 sudo cp ~/.bashrc 
 
}

install_python36(){

  sudo $APT install zlib1g-dev
  echo "*********************"
  echo "DOWNLOADING PYTHON ${PYTHON_VERSION}..."
  echo "*********************"
  
  sudo $APT install build-essential checkinstall
  sudo $APT install libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev
  
  cd /opt
  sudo wget https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tar.xz
  sudo tar xvf Python-${PYTHON_VERSION}.tar.xz
  #sleep 1
  cd Python-${PYTHON_VERSION}/
  echo "*********************"
  echo "CONFIGURING PYTHON..."
  echo "*********************"
  sudo ./configure --enable-optimizations
  echo "*********************"
  echo "MAKE PYTHON..."
  echo "*********************"
  sudo make altinstall
  echo "*********************"
  echo "MAKE INSTALL PYTHON..."
  echo "*********************"
  #sudo make install
  cd ..
  sudo rm -R Python-${PYTHON_VERSION}.tar.xz
  cd ..
  cd ..
  echo "*********************"
  echo "MANAGING ALTERNATIVES"
  echo "*********************"
  update-alternatives --install /usr/bin/python3 python /usr/bin/python3.6 2
  update-alternatives --install /usr/bin/python3 python /usr/bin/python3.8 1
  update-alternatives --list python
  update-alternatives --config python
  echo "*********************"
  echo "PYTHON ${PYTHON_VERSION} INSTALLED!"
  echo "*********************"
  sudo $APT install python3-pip
  sudo python3.6 -m pip install --upgrade pip
  sudo $APT install python3-venv
  
}

install_python36




