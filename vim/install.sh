#!/usr/bin/env bash

# if Vundle is not yet installed to so
if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]
then
	echo "Vundle not yet cloned. Cloning now!"
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim	
fi

# finally install the plungins
mvim -v "+PluginInstall" "+qall"
