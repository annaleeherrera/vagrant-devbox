# Vagrant Dev Box

This project provides a full working development environment for working on
Estately's applications. It uses Vagrant and Ansible to build an Ubuntu virtual
machine with everything you need to run our Ruby and JavaScript code in
development mode.

It sets up a shared directory so - if you want - you can continue to edit
source code locally how you do now, but run the code on the virtual machine.

## Instructions

This is a work in progress.

### Clone the vagrant-devbox repository locally

    git clone git@github.com:estately/vagrant-devbox.git

### Unzip your VPN configuration files

### Install Virtual Box and Vagrant

On Mac I do this with Homebrew and Cask:

    brew tap caskroom/cask
    brew cask install vagrant virtualbox virtualbox-extension-pack

On Ubuntu the following might work (please verify and fix this doc!)

    sudo apt-get install vagrant virtualbox virtualbox-guest-additions-iso virtualbox-ext-pack

### Install Ansible

Use `brew` or `apt-get` to install Ansible. You must install Ansible 2.1 or higher.

### Bring up Vagrant VM

    vagrant up


The first time you do this, it will download the base virtual machine, which is
about 600Mb.

Then it will create a new VM based on it, and provision all the packages you
need to work. This usually takes about 10-20 minutes.

You'll be asked for an admin/root password while the VM sets up an NFS share.

If it fails while provisioning after the VM has been booted, you can run
`vagrant provision` to continue after fixing your issue.

### SSH to Vagrant VM

While still in the vagrant-devbox directory, execute the following command:

    vagrant ssh-config --host vagrant

This will output a configuration block for your `~/.ssh/config` file. It should look something like this:

		Host vagrant
			HostName 127.0.0.1
			User ubuntu
			Port 2222
			UserKnownHostsFile /dev/null
			StrictHostKeyChecking no
			PasswordAuthentication no
			IdentityFile /Users/norman/work/devbox/.vagrant/machines/default/virtualbox/private_key
			IdentitiesOnly yes
			LogLevel FATAL
			ForwardAgent yets

After adding this to your `~/.ssh/config` file, you can log into the virtual machine any time with:

		ssh vagrant

### Using the development environment

If you spend all day working inside an SSH session, it's convenient to use a
multiplexer like Tmux or screen.

Before anything else, check that SSH forwarding is working properly by
executing

    ssh git@github.com

If it's working properly you should see a message like:

    Hi <user name>! You've successfully authenticated, but GitHub does not provide shell access.
    Connection to github.com closed.

### Initialize the database

		cd ~/work/estately/estately
		rake db:init db:replicate

### Run the Estately application

The Estately is configured only listens on 127.0.0.1 for security purposes.
This will make it impossible to access if you run if from the virtual machine,
so tell it to listen on all ip addresses:

    rails server webrick -b 0.0.0.0

Use the web server webrick rather than the default (Unicorn) because in this
environment, Unicorn tends to lock up after a few changes to asset files.

### Customizing the environment

You can copy `playbook.local.yml.example` to `playbook.local.yml` and add your own tweaks to your setup.

### Known Issues

List them here!
