# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.5.0"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.hostname = "godoc-berkshelf"
  
  config.omnibus.chef_version = :latest

  config.vm.box = "precise64-chef11.8"
  config.vm.box_url = "https://s3.amazonaws.com/crowdsurge-ops-bucket/precise64-chef11.8.box"

  config.vm.network :private_network, type: "dhcp"

  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.json = {
    }

    chef.run_list = [
        "recipe[godoc::default]"
    ]
  end
end
