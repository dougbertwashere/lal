#!/bin/bash

DIR=/home/$USER/dev/bpytop

if [ -e $DIR ]
then
	cd $DIR
	sudo make install
fi
