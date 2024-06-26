#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

brew update
brew upgrade

# Install homebrew packages
brew install $(cat $DOTFILES/brew/brewfile | grep -v "#")

brew tap common-fate/granted
brew tap tofuutils/tap

# Install casks
brew install --cask $(cat $DOTFILES/brew/caskfile | grep -v "#")

brew cleanup

exit 0
