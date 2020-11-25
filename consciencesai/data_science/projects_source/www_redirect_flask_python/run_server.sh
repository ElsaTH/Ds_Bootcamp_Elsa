#!/bin/bash
#Author: Gabriel Vazquez Torres
python -m venv env_flask
source env_flask/bin/activate
pip install flask
python main.py >> log.txt 2>&1 &
echo Running
deactivate
