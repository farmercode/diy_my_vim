#!/bin/bash
#

vundle_dir=~/.vim/bundle/vundle
if [ -d $vundle_dir ];then
	echo "installing vundle.Please wait."
	git clone https://github.com/gmarik/vundle.git $vundle_dir

fi

cp vimrc_config ~/.vimrc
