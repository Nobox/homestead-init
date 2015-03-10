#!/usr/bin/env bash

# If you would like to do some extra provisioning you may
# add any commands you wish to this file and they will
# be run after the Homestead machine is provisioned.

if [ ! -f /usr/local/extra_homestead_software_installed ]; then
    echo "Installing some extras..."

    # Install Zsh
    sudo apt-get install -y zsh

    # Install notify-send for gulp-notify
    sudo apt-get install -y libnotify-bin notify-osd

    # Install oh-my-zsh
    git clone git://github.com/robbyrussell/oh-my-zsh.git /home/vagrant/.oh-my-zsh
    cp /home/vagrant/.oh-my-zsh/templates/zshrc.zsh-template /home/vagrant/.zshrc
    chsh -s /usr/bin/zsh vagrant

    # Some apps need ImageMagick
    sudo apt-get install -y imagemagick
    sudo apt-get install -y php5-imagick

    # Install Ruby
    sudo apt-get install -y ruby-full

    # Remember that this installation ran
    touch /usr/local/extra_homestead_software_installed
else
    echo "Extras already installed..."
fi
