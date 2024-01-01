#!/bin/bash

# Create custom URL for the repo
repo_url="https://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@github.com/avengers-p6/attendance-api.git"

# Clone the repository
git clone "$repo_url"

# Install apt packages
sudo cp ~/attendance.service /etc/systemd/system/
sudo apt -y update && sudo apt -y upgrade
sudo apt -y update && sudo apt -y install  python3
sudo apt -y update && sudo apt -y install python3-pip
sudo apt -y update && sudo apt -y install gunicorn
sudo apt -y update && sudo apt -y install jq

#install required packages
pip install psycopg2
pip install psycopg2-binary
pip install redis
pip install voluptuous
pip install flask_caching
pip install peewee
pip install flasgger
pip install prometheus_flask_exporter
pip install flask-cors
pip install python-json-logger
pip install awscli

#Set path
echo 'export PATH=$PATH:/home/ubuntu/.local/bin' >> ~/.bashrc
source ~/.bashrc

# Setup the attendance service
sudo systemctl daemon-reload
sudo systemctl start attendance.service
sudo systemctl enable attendance.service
