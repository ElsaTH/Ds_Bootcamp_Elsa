#!/bin/sh
# Author: Gabriel Vázquez Torres | ConsciencesAI
if [ -z $USER_NAME ]; then
  USER_NAME="ec2-user"
fi
if [ -z $ROOT_PATH ]; then
  ROOT_PATH="/home/$USER_NAME/consciencesai" 
fi
if [ -z $APT ]; then
  APT="yum"
fi

CONFIGURATION_FILES_PATH="${ROOT_PATH}/configuration_files"
SPARK_PATH="${CONFIGURATION_FILES_PATH}/spark"
PYTHON_PATH="${CONFIGURATION_FILES_PATH}/python_package"
FLASK_PATH="${CONFIGURATION_FILES_PATH}/flask"
echo ""
echo "********************"
echo "User: $USER_NAME"
echo "Rootpath: $ROOT_PATH"
echo "********************"

#bash ${FLASK_PATH}/create_flask_files_service.sh "$USER_NAME" "$ROOT_PATH" "$APT"
bash ${FLASK_PATH}/start_flask_service.sh "$USER_NAME" "$ROOT_PATH" "$APT"




