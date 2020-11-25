#!/bin/sh
USER_NAME="consciencesai"
ROOT_PATH="/home/$USER_NAME/consciencesai" 
APT="apt"


read -p "Do you wish to start the developer installation (WRITE 'y' or 'n')?`echo $'\n>>> '`" yn
if [[ $yn == "Y" || $yn == "y" ]]; then
  echo "***************************"
  echo "**Developer Installation Started...**"
  echo "***************************"
  sudo $APT update
  #sudo $APT install python3-pip
  #sudo $APT install python3-venv
  sudo $APT install software-properties-common apt-transport-https wget
  sudo wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
  # Downloading Visual Studio Code
  sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
  sudo apt update
  sudo apt install code
  echo "***************************"
  mkdir "$ROOT_PATH/data_science_developer/"
  sudo cp -avr $ROOT_PATH/configuration_files/projects_source/ data_science_developer/
else	
  echo "Installation cancelled"
fi
