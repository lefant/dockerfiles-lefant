FROM ubuntu:18.04

ADD install.sh /tmp/install.sh
RUN sh /tmp/install.sh

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

ENV PYTHONUNBUFFERED 1
ENV PIP_NO_CACHE_DIR off

ENV DOCKER_HACKBOX 1

# RUN curl https://raw.githubusercontent.com/kennethreitz/pipenv/master/get-pipenv.py | python3

# RUN mkdir -p /opt/pipenv/
# ADD Pipfile Pipfile.lock /opt/pipenv/
# WORKDIR /opt/pipenv/
# RUN pipenv install --deploy --system

# add a user
RUN adduser --disabled-password  --gecos "" lefant
RUN adduser lefant sudo

USER lefant
WORKDIR /home/lefant


# install emacs packages
# check out https://github.com/raxod502/straight.el has lockfile with versions etc...
COPY init-packages.el /tmp
RUN emacs --script /tmp/init-packages.el


RUN mkdir -p /home/lefant/git/lefant
RUN git clone git://github.com/lefant/dotfiles-lefant /home/lefant/git/lefant/dotfiles-lefant
RUN /home/lefant/git/lefant/dotfiles-lefant/dot-bin/linkifnotexists.sh


# USER=lefant zsh
# docker run -eUSER=lefant -ti hackbox zsh

# TODO:
# mount .zsh/history
# mount Dropbox?
# key management? mount in .ssh? leverage keychain for agent? https://gist.github.com/d11wtq/8699521


CMD ["sleep", "infinity"]
