#!/bin/bash
#
#安装依赖软件包
yum -y install ctags cmake clang python
vim_plugin_dir=~/.vim/bundle
vundle_dir=$vim_plugin_dir"/vundle"
if [ ! -d $vundle_dir ];then
	echo "installing vundle.Please wait."
	git clone https://github.com/gmarik/vundle.git $vundle_dir

fi

cp vimrc_config ~/.vimrc
vim +BundleInstall +qall
#下载YoucompleteMe插件，使用vundle安装时总是失败
YoucompleteMeInstallFile=$vim_plugin_dir"/YouCompleteMe/install.py"
if [[ ! -f $YoucompleteMeInstallFile ]]; then
    git clone https://github.com/Valloric/YouCompleteMe.git $vim_plugin_dir
fi
pushd $vim_plugin_dir"/YouCompleteMe"
git submodule update --init --recursive
$YoucompleteMeInstallFile --clang-completer
