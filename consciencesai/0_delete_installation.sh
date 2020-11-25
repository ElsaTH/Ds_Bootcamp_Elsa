#!/bin/bash
# Author: Gabriel Vázquez Torres | ConsciencesAI

### This file must be executed in /consciencesai
  
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

### If /data_science exists, this deletes it if user insert 'y'
DATA_SCIENCE_DIR="data_science/"

if [ -d "$DATA_SCIENCE_DIR" ]; then
  ### Take action if $DIR exists ###
  echo "********************"
  echo "data_science/ folder already exist..."
  read -p "Do you want to delete it and uninstall the previous installation (WRITE 'y' or 'n')?`echo $'\n> '`" yn
  if [[ $yn == "Y" || $yn == "y" ]]; then
    sudo rm -rf data_science/
    bash ${SPARK_PATH}/uninstall_spark_hadoop.sh
    bash ${PYTHON_PATH}/uninstall_python.sh
    echo "Delete installation successfully."
  else
    echo "Cancelled."
  fi
fi



