FROM nvidia/cuda:8.0-cudnn5-devel-ubuntu16.04

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

ENV PYTHONUNBUFFERED 1

ADD install.sh /tmp/install.sh
RUN sh /tmp/install.sh

RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py && \
    rm get-pip.py

# must be installed before scikit-learn
RUN pip3 install numpy
RUN pip3 install scipy

ADD requirements.txt /tmp/requirements.txt
RUN pip3 install -r /tmp/requirements.txt

RUN pip3 install --upgrade git+git://github.com/lefant/scikit-optimize.git

RUN pip3 install https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow_gpu-0.12.0rc0-cp35-cp35m-linux_x86_64.whl
RUN pip3 install git+git://github.com/Theano/Theano.git
RUN pip3 install keras

ENV TINI_VERSION v0.9.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

EXPOSE 8888
ENTRYPOINT ["/tini", "--"]
CMD ["jupyter", "notebook", "--ip=0.0.0.0"]
