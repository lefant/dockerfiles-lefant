FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04

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

ENV CUDA_HOME /usr/lib/x86_64-linux-gnu

RUN curl https://raw.githubusercontent.com/kennethreitz/pipenv/master/get-pipenv.py | python3

RUN mkdir -p /opt/pipenv/
ADD Pipfile Pipfile.lock /opt/pipenv/
WORKDIR /opt/pipenv/
RUN pipenv install --deploy --system


RUN pip3 install --upgrade http://download.pytorch.org/whl/cu90/torch-0.3.1-cp35-cp35m-linux_x86_64.whl
RUN pip3 install --upgrade pyro-ppl torchvision

# ADD xgboost.sh /tmp/xgboost.sh
# RUN sh /tmp/xgboost.sh

RUN pip3 install --upgrade git+git://github.com/AmazaspShumik/sklearn-bayes.git


ENV TINI_VERSION v0.16.1
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

ADD run_jupyter.sh /opt/run_jupyter.sh

CMD ["sh", "/opt/run_jupyter.sh"]
