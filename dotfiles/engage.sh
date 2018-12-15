#!/bin/bash

DOTCONFIG=dotfiles.cfg

if [ ! -r $DOTCONFIG ] ; then
    echo "Configuration file ($DOTCONFIG) not found, exiting"
    exit 1
fi

dotfiles=()
while read -r DOTFILE; do
    dotfiles+=($DOTFILE)
done < <(egrep -v "^$|^#" $DOTCONFIG)

for FILE in ${dotfiles[@]}; do
    SRC_DOT=$FILE
    TGT_DOT=~/${FILE#[^/]*/}

    if [ -f $SRC_DOT -a ! -e $TGT_DOT ] ; then
        cp $SRC_DOT $TGT_DOT
    else
        echo "Not copying $SRC_DOT to $TGT_DOT (does $TGT_DOT already exist?)"
        exit 1
    fi
done
