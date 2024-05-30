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
code --install-extension dotjoshjohnson.xml
code --install-extension esbenp.prettier-vscode
code --install-extension github.copilot
code --install-extension github.copilot-chat
code --install-extension golang.go
code --install-extension hashicorp.terraform
code --install-extension hediet.vscode-drawio
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-dotnettools.csdevkit
code --install-extension ms-python.python
code --install-extension ms-vscode-remote.remote-containers
code --install-extension ms-vscode-remote.remote-ssh
code --install-extension ms-vscode.cpptools-extension-pack
code --install-extension ms-vscode.makefile-tools
code --install-extension nhoizey.gremlins
code --install-extension premparihar.gotestexplorer
code --install-extension quicktype.quicktype
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension streetsidesoftware.code-spell-checker-german
code --install-extension vscodevim.vim
code --install-extension znck.grammarly
code --install-extension zxh404.vscode-proto3
