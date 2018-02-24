#!/bin/sh

jupyter nbextension enable --py widgetsnbextension
jupyter notebook --ip=0.0.0.0 --allow-root
