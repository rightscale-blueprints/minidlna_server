#MiniDLNA Server

##Description

A RightScale (Chef) Blueprint for a MiniDLNA server.

##Requirements

* Chef 0.10.10 < 0.11.0 (earlier versions may work with some cookbooks/recipes)
* A Linux host

##Usage

See the Quick Start below to get started.

###Cookbooks

The following core cookbooks are included:

* minidlna
* monit
* system

Additional/depends cookbooks:

* apt
* cron

See the `Cheffile.lock` for details on their upstream sources.

###Chef Attributes

TODO

##Quick Start

###VirtualBox with Vagrant

####Install VirtualBox

Follow the VirtualBox documentation to install VirtualBox if not already installed.

####Install Vagrant

	sudo gem install vagrant --no-rdoc --no-ri

####Clone the minidlna_server Blueprint

	mkdir -p ~/src/github/rightscale-blueprints && cd ~/src/github/rightscale-blueprints
	git clone git://github.com/rightscale-blueprints/minidlna_server.git
	cd minidlna_server

####Run with Vagrant

Already up'd a minidlna_server box?

	#vagrant status                   # check vm status
	#vagrant reload                   # reload the vm
	#vagrant suspend                  # suspend the vm
	#vagrant halt                     # power down the vm
	#vagrant destroy                  # destroy the vm
	#vagrant box remove minidlna_server  # remove the box

Add a new box from local or remote (Ubuntu 12.04)

	vagrant box add minidlna_server http://files.vagrantup.com/precise64.box
	#vagrant box add minidlna_server ~/Binaries/vagrant/boxes/precise64.box

Need debug?

	VAGRANT_LOG=debug

Run the virtual machine

	# vagrant up!
	vagrant up
	
This uses the `Vagrantfile` included for the Chef Solo provisioning.

##Chef Solo

Using the Vagrant/VirtualBox process above is recommended for desktop/workstations users and will provide an operational Linux server out-of-box.
The instructions below demonstrate usage with Chef Solo standalone. Commands are relative the root of the Git checkout.

	sudo chef-solo -c examples/chef-solo/solo.rb
	
By default this uses the `examples/chef-solo/node.json`. You can easily switch the JSON attributes used with another example:

	sudo chef-solo -c examples/chef-solo/solo.rb -j examples/chef-solo/node.json.minimal
	
Its also possible to run with the cookbooks source as remote. This is handy because no Git checkout is needed:

	sudo chef-solo -r https://github.com/rightscale-blueprints/minidlna_server/tarball/master
	
And with a specific tag such as `Rev1`:

	sudo chef-solo -r https://github.com/rightscale-blueprints/minidlna_server/tarball/rev1

For more information on using Chef Solo, see http://wiki.opscode.com/display/chef/Chef+Solo

#Using Librarian

##Install Librarian

	sudo gem install librarian --no-rdoc --no-ri

##Updating cookbooks

Set this environment variable to strip .git from each cookbook checkout:

	export LIBRARIAN_CHEF_INSTALL__STRIP_DOT_GIT=1

To update a cookbook (example, postgresql):
	
	librarian-chef update rightscale

To refresh all the cookbooks in `cookbooks/` per the `Cheffile`, run the following:

	librarian-chef install
	
#Errata

##Directories and files in this repository

The root of the repository contains `Cheffile` and `Cheffile.lock` files from librarian. A shell script, `generate_metadata.rb` is provided to re-generate particular cookbooks `metadata.json` (such as upstream cookbooks that do not include a `metadata.json`).

	cookbooks/			Librarian stored (cached) upstream cookbooks from `Cheffile`.

TODO: MANIFEST file.

License and Author
==================

Author:: Chris Fordham (<chris@xhost.com.au>)

Copyright 2012, Chris Fordham

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.