#!/bin/sh -e

java -jar kgsGtp-3.5.20/kgsGtp.jar kgsGtp.conf name=$NAME password=$PASSWORD "${KGSGTP_ARGS}" "$@"
