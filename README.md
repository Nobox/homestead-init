# Homestead Setup

## VirtualBox and Vagrant

Start by installing [Homebrew](http://brew.sh/) and [Cask](http://caskroom.io/) if you haven't already.

Now install these two with Cask. It's easier and further updates are trivial.

```
brew cask install virtualbox vagrant
```

## Installing Homestead

Install the vagrant box

```
vagrant box add laravel/homestead
```

Clone the Homestead repository to your home directory and run its script.

```
git clone https://github.com/laravel/homestead.git Homestead
cd ~/Homestead
bash init.sh
```

## Extras

Our development team workflow requires Homestead to have some more additional software installed. [Learn more](docs/about.md)

Clone this repo to wherever you want and run its own script:

```
git clone https://github.com/laravel/homestead.git homestead-init
cd homestead-init
bash init.sh
```

## Setup SSH

If you don't have an SSH key yet, follow Github's [guide](https://help.github.com/articles/generating-ssh-keys/) on the subject.

## Configure shared folders

In the folders property of the `Homestead.yaml` file should be the path to the directory you wish to share with the VM. Mapping your entire `Sites` directory is fine.

```
folders:
    - map: ~/Sites
      to: /home/vagrant/Code
```

## Configure Nginx sites

Follow the site configuration already provided in the `Homestead.yaml` file and add entries for each of your sites. Each site should map its web root, which in our case is `public`.

Map the domain name for each site to its folder, and add them to your `/etc/hosts` file pointing to the virtual machine's IP address set in `Homestead.yaml`, which by default is `192.168.10.10`.

```
127.0.0.1   localhost
192.168.10.10   homestead.app
...
```

## Run Homestead box

The final step is to obviously create the virtual machine.

```
cd ~/Homestead
vagrant up
```

This command will create a vagrant VM, provision it with Homestead's default provision, and then run our custom after.sh script that adds the remaining ingredients.

After it's done, you can visit any of the sites through the defined URLs

```
http://homestead.app
```

## SSH

You can go into the virtual machine through an SSH connection.

```
cd ~/Homestead
vagrant ssh
```

The `~/Code` folder should now have the same structure as your mapped directory.

## Databases

To connect to Homestead's databases from your **host** machine via software like Sequel Pro, you should connect to `127.0.0.1` on port 33060 (MySQL) or 54320 (Postgres), then create databases as usual.

## More information

* [Homestead documentation](http://laravel.com/docs/5.0/homestead)
* [Vagrant docs](https://docs.vagrantup.com/v2/)
