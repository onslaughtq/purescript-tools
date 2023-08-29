#!/bin/bash

set -e

git clone https://github.com/purescript/spago.git ~/spago

cd ~/spago

git checkout 0.21.0

make install
