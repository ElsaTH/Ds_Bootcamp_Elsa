#!/bin/bash
# Author: Gabriel Vázquez Torres | ConsciencesAI
USER_NAME=$1 
ROOT_PATH=$2
APT=$3

CONFIGURATION_FILES_PATH="${ROOT_PATH}/configuration_files"
PYTHON_PATH="${CONFIGURATION_FILES_PATH}/python_package"
FLASK_PATH="${CONFIGURATION_FILES_PATH}/flask"

echo "***************************"
echo "**FLASK AS SERVICE INSTALLATION STARTING...**"
echo "***************************"

sudo python3 -m pip install flask
echo ""
echo "Uninstalling previous Flask Service if exists..."
sudo systemctl stop flask
sudo systemctl disable flask
sudo rm -rf /etc/init/flask.conf
sudo rm -rf /lib/systemd/system/flask.service
sudo rm -rf /etc/systemd/system/flask
sudo rm -rf /etc/systemd/system/flask.service
sudo rm -rf /usr/lib/systemd/system/flask
sudo rm -rf /usr/lib/systemd/system/flask.service
echo ""
echo "Flask service uninstalled!"
echo ""
sudo systemctl daemon-reload
sudo systemctl reset-failed
echo "Installing Flask as service..."

bash ${FLASK_PATH}/create_flask_files_service.sh "$USER_NAME" "$ROOT_PATH" "$APT"

sudo cp -avr ${FLASK_PATH}/flask.conf /etc/init/flask.conf
sudo cp -avr ${FLASK_PATH}/flask.service /lib/systemd/system/flask.service
sudo systemctl daemon-reload
sudo systemctl reset-failed
echo "Flask as service installed."
sudo chown $USER_NAME $ROOT_PATH/data_science/projects_source/www_redirect_flask_python/main.py
echo 'chown $USER_NAME $ROOT_PATH/data_science/projects_source/www_redirect_flask_python/main.py'
echo "chown done"
sudo chmod +x $ROOT_PATH/data_science/projects_source/www_redirect_flask_python/main.py
echo "chmod +x to main.py"
echo "chmod done"
echo ""
echo "Running Flask service..."
sudo service flask start
echo "***************************"
echo "Write:"
echo ">>>sudo service flask status"
echo "to see the status of the service"
echo "***************************"
sudo rm -rf ${FLASK_PATH}/flask.conf
sudo rm -rf ${FLASK_PATH}/flask.service
echo "Finish flask as service successfully"
echo "************************************"
echo "FINISH FLASK AS SERVICE PROCESS"
echo "************************************"
