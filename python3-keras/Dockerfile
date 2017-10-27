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

RUN curl https://raw.githubusercontent.com/kennethreitz/pipenv/master/get-pipenv.py | python3

RUN mkdir -p /opt/pipenv/
ADD Pipfile Pipfile.lock /opt/pipenv/
WORKDIR /opt/pipenv/
RUN pipenv install --deploy --system


RUN pip3 install --upgrade http://download.pytorch.org/whl/cu80/torch-0.2.0.post3-cp35-cp35m-manylinux1_x86_64.whl
RUN pip3 install --upgrade torchvision

ADD xgboost.sh /tmp/xgboost.sh
RUN sh /tmp/xgboost.sh

RUN pip3 install --upgrade git+git://github.com/AmazaspShumik/sklearn-bayes.git


ENV TINI_VERSION v0.16.1
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

EXPOSE 8888
ENTRYPOINT ["/tini", "--"]
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--allow-root"]
