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

RUN pip3 install --no-cache pipenv

ADD Pipfile Pipfile.lock /tmp/
WORKDIR /tmp/
RUN pipenv install


# RUN pip3 install --upgrade git+git://github.com/AmazaspShumik/sklearn-bayes.git

RUN pip3 install --upgrade http://download.pytorch.org/whl/cu80/torch-0.2.0.post3-cp35-cp35m-manylinux1_x86_64.whl
RUN pip3 install --upgrade torchvision

ADD xgboost.sh /tmp/xgboost.sh
RUN sh /tmp/xgboost.sh


ENV TINI_VERSION v0.9.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

EXPOSE 8888
ENTRYPOINT ["/tini", "--"]
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--allow-root"]
