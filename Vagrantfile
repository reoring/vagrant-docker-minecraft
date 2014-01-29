# -*- mode: ruby -*-
# # vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.provision "shell", path: "provision.sh"
  config.vm.synced_folder ".", "/vagrant"

  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
  config.ssh.username = "ubuntu"

  # Fix docker not being able to resolve private registry in VirtualBox
  config.vm.provider :virtualbox do |vb, override|
    override.vm.network "private_network", ip: "172.12.8.151"
    override.vm.box = "ubuntu13.04_with_docker"

    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end
  
  config.vm.provider :aws do |aws, override|
    config.omnibus.chef_version = :latest
    config.vm.box = "dummy"
    aws.tags = {
      'Name' => 'Minecraft'
    }

    aws_config = YAML.load_file("aws_config.yml")

    aws.access_key_id     = aws_config["aws_access_key"]
    aws.secret_access_key = aws_config["aws_secret_access_key"]
    aws.keypair_name      = "minecraft"
    #aws.security_groups   = %w[sg-cbc0d5a9]

    aws.ami = "ami-6fd25e6e" 
    aws.instance_type = "m1.small"

    aws.region = "ap-northeast-1"

    override.ssh.private_key_path = "minecraft.pem"
  end
end
