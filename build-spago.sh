#!/bin/sh

set -e

git clone https://github.com/purescript/spago.git ~/spago

cd ~/spago

git checkout 0.20.9

make
make install
