# -*- mode: ruby -*-
# vi: set ft=ruby :

# Simple Vagrant file
Vagrant.configure("2") do |config|

  config.vm.define :master do |master|
    master.vm.box = "precise64"
    master.vm.box_url = "http://files.vagrantup.com/precise64.box"
    master.vm.network :private_network, ip: "10.11.1.100"
    master.vm.provision :puppet do |puppet|
      puppet.manifests_path = "provision/manifests"
      puppet.manifest_file  = "master.pp"
      #puppet.module_path = "provision/modules"
    end
  end

  config.vm.define :slave do |slave|
    slave.vm.box = "precise64"
    slave.vm.box_url = "http://files.vagrantup.com/precise64.box"
    slave.vm.network :private_network, ip: "10.11.1.101"
#    master.vm.provision :puppet do |puppet|
#      puppet.manifests_path = "provision/manifests"
#      puppet.manifest_file  = "slave.pp"
#    end
  end

end
