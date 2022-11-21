# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

# Global box name used in this vagrant file
#VAGRANT_BOX = "ubuntu/focal64"

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
#      config.vm.box = VAGRANT_BOX
      config.vm.provider :virtualbox do |v|
        v.memory = 4082
        v.cpus = 1
        v.gui = true
      end
      # Run global provisioners
      #config.vm.provision :file do |file|
      #   file.source     = './keys/vagrant'
      #   file.destination    = '/tmp/vagrant'
      #  end
      
      #config.vm.provision :shell, path: "bootstrap-node.sh"

      # Set VM specific details
      
      # Ghosts Linux client
      #config.vm.define "gLinuxClient" do |gclient|
      #  gclient.vm.box = "peru/ubuntu-20.04-desktop-amd64"
        #gclient.vm.box_version = "20210908.01"
      #	gclient.vm.hostname = "ghostclient1.demo.com"
      #	gclient.vm.network "private_network", ip: "192.168.56.10"
      #	gclient.vm.provision :ansible do |ansible|
      # ansible.verbose = "v"
      #  ansible.playbook = "ghostLinuxClient_playbook.yml"
      #  end
        # Network manager auto enables eth1. Switch back to eth0
      #config.vm.provision "shell", inline: "sudo nmcli dev connect eth0"
     #end
      
      # Ghosts server
      config.vm.define "gserver" do |gserver|
        gserver.vm.box = "ubuntu/focal64"
      	gserver.vm.hostname = "ghostserver.demo.com"
      	gserver.vm.network :private_network, ip: "192.168.56.3"
      	gserver.vm.provision :ansible do |ansible|
        ansible.verbose = "v"
        ansible.playbook = "ghostserver_playbook.yml"
        end
        gserver.vm.provision :file do |file|
          file.source     = './inventory-test.yaml'
          file.destination    = '/home/vagrant/inventory-test.yaml'
         end
      end
     config.vm.define "gWinClient" do |gWinClient|
      gWinClient.vm.box = "gusztavvargadr/windows-10"
      gWinClient.vm.hostname = "ghostclient2"
      gWinClient.vm.network :private_network, ip: "192.168.56.11"
      gWinClient.vm.provision :file do |file|
        file.source = './ghosts-client-x64-v6.2.0.zip'
        file.destination = 'c:\Windows\temp\ghosts-client-x64-v6.2.0.zip'
        end
      gWinClient.vm.provision "shell" do |shell|
        shell.path = 'ghosts.ps1'
        end
    end
end
