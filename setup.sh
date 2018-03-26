#!/usr/bin/env bash

set -e

echo "This script will make your Mac awesome"

# install xcode command line tools if they're not already there
xcode-select -v || xcode-select --install

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Updating homebrew..."
brew update

echo "Checking if your system is ready to brew..."
brew doctor

# hack to initialize brew cask
#brew cask doctor || $(brew install caskroom/cask/brew-cask && brew cask install google-chrome && brew cask doctor)

if test ! $(which ansible); then
  echo "Installing ansible via homebrew..."
  brew install ansible
fi

#brew cask setup initial
ansible-playbook -i localhost, playbook.yml --ask-become-pass

source ~/.bash_profile
