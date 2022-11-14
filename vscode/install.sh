#!/bin/bash

###
# Link the `settings.json` file
###
SETTINGS_FILE="${HOME}/Library/Application Support/Code/User/settings.json"

if [ -f "$SETTINGS_FILE" ] && ! [ -L "$SETTINGS_FILE" ]
then
	mv "$SETTINGS_FILE" "${SETTINGS_FILE}.backup"
fi

if ! [ -L "$SETTINGS_FILE" ]
then
	ln -s "${DOTFILES}/vscode/settings.json.symlink" "$SETTINGS_FILE"
fi

###
# Install the extensions
###
code --install-extension esbenp.prettier-vscode
code --install-extension hashicorp.terraform
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-vscode.makefile-tools
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension streetsidesoftware.code-spell-checker-german
code --install-extension vscodevim.vim
code --install-extension ms-python.python
