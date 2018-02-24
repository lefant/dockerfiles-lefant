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
wget

python-dev
python-opencv
python-setuptools
python-snappy
python-tk
python-wheel
cython

cmake
gfortran
graphviz
libagg-dev
libatlas-dev
libffi-dev
libfreetype6-dev
libhdf5-dev
libjpeg-dev
liblapack-dev
libncurses5-dev
libopenblas-dev
libpng12-dev
libxft-dev
libxml2-dev
libxslt-dev
swig
zlib1g-dev

ttf-bitstream-vera
EOF
)

apt-get install -y $PACKAGES
apt-get clean
