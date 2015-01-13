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
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew upgrade

# Install homebrew packages
brew install $(cat $ZSH/homebrew/brewfile | grep -v "#")

# Install casks
brew cask install $(cat $ZSH/homebrew/caskfile | grep -v "#")

brew cleanup

exit 0
