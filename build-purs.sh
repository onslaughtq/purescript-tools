#!/bin/sh

set -e

git clone https://github.com/purescript/purescript.git ~/purescript

cd ~/purescript

git checkout v0.15.4

stack install --local-bin-path /usr/local/bin

rm -r ~/purescript
