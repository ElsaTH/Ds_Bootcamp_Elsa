#!/bin/bash
# Author: Gabriel Vázquez Torres | ConsciencesAI
python3 -m venv env_flask
source env_flask/bin/activate
sudo python3 -m pip install flask
python3 main.py >> log.txt 2>&1 &
echo Running
deactivate
