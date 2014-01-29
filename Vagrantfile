# -*- mode: ruby -*-
# # vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.provision "shell", path: "provision.sh"
  config.vm.synced_folder ".", "/vagrant"

  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  # Fix docker not being able to resolve private registry in VirtualBox
  config.vm.provider :virtualbox do |vb, override|
    override.ssh.username = "ubuntu"
    
    override.vm.network "private_network", ip: "172.12.8.151"
    override.vm.box = "ubuntu13.04_with_docker"

    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end
end
