#!/bin/sh

set -x 

dir=$(dirname $(readlink -f $0)) 

mkdir -p $HOME/.config
stow -d $dir -t $HOME .
