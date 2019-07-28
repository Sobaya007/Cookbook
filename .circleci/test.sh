#!/usr/bin/env bash

set -e
set -u

curl https://dlang.org/install.sh | bash -s

~/dlang/install.sh dmd -a
ls /home/circleci
ls /home/circleci/dlang
ls ~/dlang

source $(~/dlang/install.sh dmd -a)

dub test
dub build --build=docs
