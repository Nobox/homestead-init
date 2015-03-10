#!/usr/bin/env bash

# Install terminal-notifier with Homebrew
brew update && brew install terminal-notifier

# Install vagrant-notify plugin
vagrant plugin install vagrant-notify

# Copy notify-send forwarding file
sudo cp notify-send /usr/local/bin/
sudo chmod +x /usr/local/bin/notify-send

stubsRoot=./stubs
homesteadRoot=~/.homestead

# Copy custom Homestead stubs to ~/.homestead
cp -i $stubsRoot/Homestead.yaml $homesteadRoot/Homestead.yaml
cp -i $stubsRoot/after.sh $homesteadRoot/after.sh
cp -i $stubsRoot/aliases $homesteadRoot/aliases
