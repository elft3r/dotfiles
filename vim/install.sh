#!/usr/bin/env bash
export DOTFILES=$HOME/.dotfiles

# if Vundle is not yet installed to so
if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]
then
	echo "Vundle not yet cloned. Cloning now!"
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# finally install the plungins
mvim -v "+PluginInstall" "+qall"

## and configure the plugins
# You Complete Me
cd $HOME/.vim/bundle/YouCompleteMe
./install.py --clang-completer --gocode-completer
