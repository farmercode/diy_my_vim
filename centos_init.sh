#!/bin/bash
#
#安装依赖软件包
yum -y install ctags cmake clang python

vundle_dir=~/.vim/bundle/vundle
if [ ! -d $vundle_dir ];then
	echo "installing vundle.Please wait."
	git clone https://github.com/gmarik/vundle.git $vundle_dir

fi

cp vimrc_config ~/.vimrc
vim +BundleInstall +qall
#下载YoucompleteMe插件，使用vundle安装时总是失败
YoucompleteMeInstallFile=$vundle_dir"/YouCompleteMe/install.py"
if [[ ! -f $YoucompleteMeInstallFile ]]; then
    git clone https://github.com/Valloric/YouCompleteMe.git $vundle_dir
    pushd $vundle_dir"/YouCompleteMe"
    git submodule update --init --recursive
    $YoucompleteMeInstallFile --clang-completer
fi
