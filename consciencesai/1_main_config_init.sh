#!/bin/sh
# Author: Gabriel Vázquez Torres | ConsciencesAI
USER_NAME=$1
ROOT_PATH=$2
APT=$3
CONFIGURATION_FILES_PATH="configuration_files"
SPARK_PATH="${CONFIGURATION_FILES_PATH}/spark/"
PYTHON_PATH="${CONFIGURATION_FILES_PATH}/python_package/"

echo "********************"

printf "\n\n *****IMPORTANT***** \n\n"

printf "Did you change the hostname or you want to do it? There are some config files in tools (Spark) that aim to linux HOSTNAME. \n\nPlease, take into account that the installation must have this in order to complete the installation successfully.\n\n"

printf "Visit:\n\n https://aws.amazon.com/premiumsupport/knowledge-center/new-user-accounts-linux-instance/ \n\n if you want to change the hostname in AWS Cloud."

printf "\n\nOtherwise, if you are in a non-cloud linux, you can use:\nsudo nano /etc/hostname \n AND \nnano /etc/hosts\n\n
To change the hostname manually. After change the values, it is mandatory reboot."
echo "********************"

read -p "Do you understand this and you want to continue with the installation (WRITE 'y' or 'n')?`echo $'\n\n> '`" yn
if [[ $yn == "Y" || $yn == "y" ]]; then
  echo ""
else
  exit 999
fi

echo ""
echo "********************"
echo "User: $USER_NAME"
echo "Rootpath: $ROOT_PATH"
echo "Rootpath: $APT"
echo "********************"


yn_root_path_global="0"
if [ -d "$ROOT_PATH" ]; then
  ### Take action if $DIR exists ###
  echo "Folder $ROOT_PATH exists."
  yn_root_path_global="1"
else
  echo "Root path does not exist..."
  echo "NOTE: Remember that you must have all the configuration files inside."
  echo "If you do not create the folder, the installation will stop"
  read -p "Do you want to create it? (WRITE 'y' or 'n')?`echo $'\n> '`" yn_root_path
  if [[ $yn_root_path == "Y" || $yn_root_path == "y" ]]; then
    mkdir "$ROOT_PATH"
    echo "$ROOT_PATH created"
    yn_root_path_global="1"
  fi
fi

if [ "$yn_root_path_global" = "1" ]; then
  bash 2_run_installation_unix.sh "$USER_NAME" "$ROOT_PATH" "$APT"
else
  echo "Installation cancelled."
fi



