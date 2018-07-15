#!/bin/bash

# Update App Store apps
sudo softwareupdate -i -a

# Update Homebrew (Cask) & packages
brew update
brew upgrade
brew cleanup -s
brew cask cleanup

# Update npm & packages
npm install npm -g
npm update -g

# Update python
pip install --upgrade pip setuptools
pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U

# Update Ruby & gems
sudo gem update —system
sudo gem update
