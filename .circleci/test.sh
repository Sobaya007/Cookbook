#!/usr/bin/env bash

set -e
set -u

type source
source "$(curl -fsS  --retry 3 https://dlang.org/install.sh | bash -s $1 --activate)"

dub test
dub build --build=docs
