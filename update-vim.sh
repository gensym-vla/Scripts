#!/bin/sh
# Author: Vedat Levi Alev
# Most of my vim plugins are cloned from git repos. This script provides  
# an easy way to update them, providing that pathogen or a comparable plugin
# which allows plugins to have their own  file hierarchies is installed.
#
# If you supply a command line argument to the script, it will assume that
# this is the directory you store your plugins in.

dir=~/.vim/bundle
if [ ! -z $1  ]
then
    if [ ! -d $1 ]
    then
        echo "Supplied argument is not a directory exiting now!"
        exit 1
    fi
    dir=$1
fi

for i in $(ls $dir)
do
    if [ -d $dir/$i/.git ]
    then
        echo Checking updates for $i
        git --git-dir=$dir/$i/.git pull
    fi
done
