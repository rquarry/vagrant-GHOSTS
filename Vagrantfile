# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

# Global box name used in this vagrant file
VAGRANT_BOX = "ubuntu/focal64"

# Define VMs with static private IP addresses, vcpu, memory and vagrant-box.
#  boxes = [
#    {
#      :name => "web1.demo.com",
#      :box => "ubuntu/focal64",
#      :ram => 1024,
#      :vcpu => 1,
#      :ip => "192.168.29.2"
#    },
#    {
#      :name => "ghostserver.demo.com",
#      :box => "ubuntu/focal64",
#      :ram => 1024,
#      :vcpu => 1,
#      :ip => "192.168.29.3"
#    },
#    {
#      :name => "ansible-host",
#      :box => "ubuntu/focal64",
#      :ram => 8048,
#      :vcpu => 1,
#      :ip => "192.168.29.4"
#    }
#  ]
#

      # Global settings for all VM's 
      config.vm.synced_folder ".", "/vagrant", id: "vagrant-root", disabled: true
      config.ssh.insert_key = false
      config.vm.box = VAGRANT_BOX
      config.vm.provider :virtualbox do |v|
        v.memory = 1024
        v.cpus = 1
        v.gui = true
      end
      # Run global provisioners
      config.vm.provision :file do |file|
         file.source     = './keys/vagrant'
         file.destination    = '/tmp/vagrant'
        end
      config.vm.provision :file do |file|
        file.source     = './inventory-test.yaml'
        file.destination    = '/home/vagrant/inventory-test.yaml'
       end
      config.vm.provision :shell, path: "bootstrap-node.sh"

      # Set VM specific details
      
      # Ghosts client
      config.vm.define "gclient" do |gclient|
      	gclient.vm.hostname = "ghostclient1.demo.com"
      	gclient.vm.network :private_network, ip: "192.168.29.10"
      	gclient.vm.provision :ansible do |ansible|
        ansible.verbose = "v"
        ansible.playbook = "ghostclient_playbook.yml"
      end
     end
      
      # Ghosts server
      config.vm.define "gserver" do |gserver|
      	gserver.vm.hostname = "ghostserver.demo.com"
      	gserver.vm.network :private_network, ip: "192.168.29.3"
      	gserver.vm.provision :ansible do |ansible|
        ansible.verbose = "v"
        ansible.playbook = "ghostserver_playbook.yml"
      end
     end
end
