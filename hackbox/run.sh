#!/bin/sh

HOME1=/home/ubuntu
HOME2=/home/lefant

mkdir -p "$HOME1"/git_schibsted
mkdir -p "$HOME1"/.ssh
touch "$HOME1"/zsh_history

docker run -hhackbox-lefant -eUSER=lefant \
       -v$(dirname $SSH_AUTH_SOCK):$(dirname $SSH_AUTH_SOCK) -e SSH_AUTH_SOCK=$SSH_AUTH_SOCK \
       -v"$HOME1"/git:"$HOME2"/git/ \
       -v"$HOME1"/.ssh:"$HOME2"/.ssh \
       -v"$HOME1"/.zsh/history:"$HOME2"/.zsh/history \
       -ti lefant/hackbox zsh
