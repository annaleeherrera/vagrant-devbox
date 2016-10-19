# Vagrant Dev Box

This project provides a full working development environment for working on
Estately's applications. It uses Vagrant and Ansible to build an Ubuntu virtual
machine with everything you need to run our Ruby and JavaScript code in
development mode.

## Instructions

This is a work in progress.

### Clone the vagrant-devbox repository locally

    git clone git@github.com:estately/vagrant-devbox.git

### Unzip your VPN configuration files
### Install Virtual Box and Vagrant
### Install Ansible
### Bring up Vagrant VM

* You'll be asked for an admin/root password while the VM sets up an NFS share.

* If it fails while provisioning after the VM has been booted, you can run `vagrant provision` to continue after fixing your issue.

### SSH to Vagrant VM
### Using the development environment

Before anything else, check that SSH forwarding is working properly by executing

    ssh git@github.com

If it's working properly you should see a message like:

    Hi <user name>! You've successfully authenticated, but GitHub does not provide shell access.
    Connection to github.com closed.

### Install and run Bundler

### Initialize the database
### Run the Estately application
### Customizing the environment
### Known Issues