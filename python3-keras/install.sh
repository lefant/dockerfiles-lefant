#!/bin/sh -e

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get upgrade -y


PACKAGES=$(xargs <<EOF
build-essential
curl
git
make
wget

python3-dev
python3-setuptools
python3-wheel

gfortran
graphviz
libagg-dev
libatlas-dev
libffi-dev
libfreetype6-dev
libhdf5-dev
liblapack-dev
libncurses5-dev
libopenblas-dev
libpng12-dev
libxft-dev
libxml2-dev
libxslt-dev
python-opencv
swig
zlib1g-dev

ttf-bitstream-vera
EOF
)

apt-get install -y $PACKAGES
apt-get clean
