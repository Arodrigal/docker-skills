#!/bin/bash

virtualenv -p python3 .venv
source .venv/bin/activate 
pip install -r requirements.txt
export MONGO_URI=mongodb://mongo-intel:f5adD95sBa@mongodb:27017/intel-db

exec python app.py