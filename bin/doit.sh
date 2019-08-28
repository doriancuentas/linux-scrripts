#!/bin/bash
#usseful scripts to use as commands for common tasks
#190302
#dorian cuentas

#source ./importdefaults.sh

nb() {
    userdir=~/.netbeans
    nbuserdir=$userdir/$1/userdir
    nbcachedir=$userdir/$1/cachedir
    echo starting netbeans with $nbuserdir
    mkdir -p $nbuserdir
#     export DISPLAY=:1
    netbeans --userdir $nbuserdir --cachedir $cachedir
}
