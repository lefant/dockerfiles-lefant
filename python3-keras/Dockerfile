FROM nvidia/cuda:8.0-cudnn6-devel-ubuntu16.04

ADD install.sh /tmp/install.sh
RUN sh /tmp/install.sh

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

ENV PYTHONUNBUFFERED 1

RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py && \
    rm get-pip.py

# must be installed before scikit-learn
RUN pip3 install numpy
RUN pip3 install scipy

# must be installed before auto-sklearn
RUN pip3 install Cython

ADD requirements.txt /tmp/requirements.txt
RUN pip3 install -r /tmp/requirements.txt


RUN pip3 install --upgrade git+git://github.com/lefant/scikit-optimize.git
RUN pip3 install --upgrade git+git://github.com/lefant/keras-vis.git
RUN pip3 install --upgrade git+git://github.com/AmazaspShumik/sklearn-bayes.git

ADD xgboost.sh /tmp/xgboost.sh
RUN sh /tmp/xgboost.sh


ENV TINI_VERSION v0.9.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

EXPOSE 8888
ENTRYPOINT ["/tini", "--"]
CMD ["jupyter", "notebook", "--ip=0.0.0.0"]
