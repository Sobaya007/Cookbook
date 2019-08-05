#!/usr/bin/env bash

set -e
set -u

source "$(curl -fsS  --retry 3 https://dlang.org/install.sh | bash -s $1 --activate)"
dub build --build=ddox

git config --global push.default simple
git config --global user.name "CircleCI"
git config --global user.email "<>"

mkdir ~/.ssh && echo -e "Host github.com\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config

git checkout -b gh-pages
git pull origin gh-pages
git add -A --force docs
git commit -m "[skip ci] Update docs"
git subtree push --prefix docs/ origin gh-pages
