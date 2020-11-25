#!/bin/sh
# Author: Gabriel Vázquez Torres | ConsciencesAI
USER_NAME=$1 
ROOT_PATH=$2
APT=$3

CONFIGURATION_FILES_PATH="${ROOT_PATH}/configuration_files"
SPARK_PATH="${CONFIGURATION_FILES_PATH}/spark"
PYTHON_PATH="${CONFIGURATION_FILES_PATH}/python_package"
FLASK_PATH="${CONFIGURATION_FILES_PATH}/flask"

printf 'description "flask"
start on stopped rc RUNLEVEL=[2345]
respawn
exec python3 '$ROOT_PATH'/data_science/projects_source/www_redirect_flask_python/main.py' > ${FLASK_PATH}/flask.conf

printf '[Unit]
Description=Flask web server
[Install]
WantedBy=multi-user.target
[Service]
User='$USER_NAME'
PermissionsStartOnly=true
ExecStart=/usr/bin/python3 '$ROOT_PATH'/data_science/projects_source/www_redirect_flask_python/main.py
TimeoutSec=1100
Restart=on-failure
RuntimeDirectoryMode=755' > ${FLASK_PATH}/flask.service
