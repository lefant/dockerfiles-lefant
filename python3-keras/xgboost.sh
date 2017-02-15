#!/bin/sh -e

cd /usr/local/src
mkdir xgboost
cd xgboost
git clone --depth 1 --recursive https://github.com/dmlc/xgboost.git
cd xgboost
make
cd python-package
python3 setup.py install
