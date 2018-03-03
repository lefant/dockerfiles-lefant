#!/bin/sh -e

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get upgrade -y


PACKAGES=$(xargs <<EOF
locales
build-essential
curl
git
make
mg
unrar
wget

python-dev
python-setuptools
python-snappy
python-wheel
cython
EOF
)

apt-get install -y $PACKAGES
apt-get clean
