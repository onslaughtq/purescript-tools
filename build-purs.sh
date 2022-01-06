#!/bin/sh

set -e

git clone https://github.com/purescript/purescript.git ~/purescript

cd ~/purescript

git checkout v0.14.5

stack install --local-bin-path /usr/local/bin

rm -r ~/purescript
