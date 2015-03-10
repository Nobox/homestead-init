# Homestead setup

These are extra steps to setup our Homestead development machines for our current dev workflow.

## Automatic installation

The `init.sh` script takes care of it all automatically. Simply run:

```
sh init.sh
```

## Manual installation

Before doing any of these steps, Homestead should already be installed following its [documentation](http://laravel.com/docs/5.0/homestead).

### Notifications

Laravel Elixir requires notifications, but Homestead by default doesn't have what it requires so tasks using `gulp-notify` will output a ton of errors.

**On your host machine**, install `terminal-notifier` with [Homebrew](http://brew.sh/)

```
brew install terminal-notifier
```

Install [Vagrant plugin](https://github.com/fgrehm/vagrant-notify) that forwards notifications.

```
vagrant install vagrant-notify
```

Copy `notify-send` script over to somewhere in your $PATH, and make it executable. This file is used by vagrant-notify to forward notifications to your machine.

```
sudo cp notify-send /usr/local/bin/
sudo chmod +x /usr/local/bin/notify-send
```

### Stubs

Homestead copies over some default scripts to `~/.homestead`. This repo contains these same files but with the extras required by our workflow. Copy them to `~/.homestead`, and provision/reload your virtual machine.

#### after.sh

This file runs after the default Homestead provisioning is done. It will run only once, then skip for further provisions.

* Installs `notify-send` OS packages for notifications support. Ubuntu server edition doesn't have it installed by default.
* Installs [Zsh](http://www.zsh.org/) and [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
* Installs ImageMagick
* Installs Ruby

#### Homestead.yaml

This file is nearly identical to Homestead's default, with the exception of having [NFS](http://docs.vagrantup.com/v2/synced-folders/nfs.html) turned on. This improves the virtual machine's performance considerably, specially npm and gulp processes.

#### aliases

This file is pretty much identical to Homestead's defaults. Could be customized later on.
