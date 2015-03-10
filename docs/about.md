## What's going on

Our present development workflow requires some extra software installed in Homestead than what it already provides.

This repo takes care of these extras automatically, assuming Homestead is already installed and configured.

The `init.sh` script does the following:

### Notifications

Laravel Elixir requires notifications, but Homestead by default doesn't have what it requires so tasks using `gulp-notify` will output a ton of errors.

1. **On your host machine**, it installs `terminal-notifier` with [Homebrew](http://brew.sh/)
2. It then installs [vagrant-notify](https://github.com/fgrehm/vagrant-notify) that forwards VM notifications to the host machine.
3. Copies `notify-send` to a directory usually in $PATH, and makes it executable. This file is used by vagrant-notify to forward notifications to your machine.

### Stubs

Homestead copies over some default scripts to `~/.homestead`. This repo contains these same files but with the extras required by our workflow. The script copies them to `~/.homestead` and overwrites the defaults.

The process will promt you for approvel to prevent accidental overwrites.

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
