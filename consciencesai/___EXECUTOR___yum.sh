#!/bin/sh

# Author: Gabriel Vázquez Torres | ConsciencesAI
USER_NAME="ec2-user"
ROOT_PATH="/home/$USER_NAME/consciencesai" 
APT="yum"

echo ""
echo "********************"
echo "User: $USER_NAME"
echo "Rootpath: $ROOT_PATH"
echo "Global Command: $APT"
echo "********************"

bash 1_main_config_init.sh "$USER_NAME" "$ROOT_PATH" "$APT"

