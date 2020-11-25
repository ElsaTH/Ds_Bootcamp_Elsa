#!/bin/bash
# Author: Gabriel Vázquez Torres | ConsciencesAI
### This file must be executed in /home/USER/consciencesai/

USER_NAME=$1 
ROOT_PATH=$2
APT=$3

CONFIGURATION_FILES_PATH="${ROOT_PATH}/configuration_files"
SPARK_PATH="${CONFIGURATION_FILES_PATH}/spark"
PYTHON_PATH="${CONFIGURATION_FILES_PATH}/python_package"
DOCKER_PATH="${CONFIGURATION_FILES_PATH}/docker"
MYSQL_PATH="${CONFIGURATION_FILES_PATH}/mysql_57_docker"
FLASK_PATH="${CONFIGURATION_FILES_PATH}/flask"

echo $USER_NAME
echo $ROOT_PATH


### If /backup exists, copy and delete files to start from the beginning
BACKUP_DIR="backup/"
CONFIGURATION_FILES_DIR="${CONFIGURATION_FILES_PATH}/"

echo "************************************"
echo "**RUN INSTALLATION UNIX STARTED...**"
echo "************************************"
echo ""

sudo rm -rf ${CONFIGURATION_FILES_PATH}/data_science/
echo ""
echo "********************"

read -p "Do you wish to start the installation (WRITE 'y' or 'n')?`echo $'\n>>> '`Installation folders must be in ./ to run successfully.`echo $'\n> '`" yn
if [[ $yn == "Y" || $yn == "y" ]]; then
  ###  Control will jump here if $DIR does NOT exists ###
  echo "***************************"
  echo "**INSTALLATION STARTED...**"
  echo "***************************"
  sudo $APT update -y
  echo "***************************"
  
  bash ${PYTHON_PATH}/python_installator.sh "$USER_NAME" "$ROOT_PATH" "$APT"
  echo "***************************"
  mkdir ${CONFIGURATION_FILES_PATH}/data_science/
  mkdir ${CONFIGURATION_FILES_PATH}/data_science/software/
  sudo cp -avr ${CONFIGURATION_FILES_PATH}/projects_source/ ${CONFIGURATION_FILES_PATH}/data_science/

  bash ${FLASK_PATH}/start_flask_service.sh "$USER_NAME" "$ROOT_PATH" "$APT"

  sudo rm -R flask/
  sudo rm -R spark/
  sudo rm -R python_package/
  sudo rm -R old_versions/
  sudo rm -R linux_gui/
  sudo rm -R docker/
  sudo rm -R mysql_57_docker/
  sudo rm -R backup/
  
  echo ""
  echo "***************************"
  echo "**    PROCESS FINISHED   **"
  echo "***************************"
else
  echo "INSTALLATION CANCELLED"
fi


