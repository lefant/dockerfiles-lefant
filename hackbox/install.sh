#!/bin/sh -e

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get upgrade -y


PACKAGES=$(xargs <<EOF
build-essential
curl
emacs-nox
git
git-lfs
gnupg
htop
less
locales
make
mg
psmisc
rsync
sudo
tmux
tree
wget
zsh

EOF
)

apt-get install -y $PACKAGES
apt-get clean
