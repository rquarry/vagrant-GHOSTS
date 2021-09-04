# Ansible Environment: 

Multi-Machine Vagrant Environments:
This Vagrantfile will create 2 Ubuntu 20.04 VM's:

* ghostserver.demo.com - Host running Cargenie Mellon's GHOSTS NPC automation platform
* ansible-host - Host intended to serve as an ansible tower, but isn't currently properly configured. 


## Requirements:

* Internet connection is a must!
* Make sure the VT support is enabled on your BIOS
* Vagrant - 1.9.x or higher
* Vagrant plugins - vagrant-proxyconf - needed if you are running behind proxy
* Ansible: latest
* Virtualbox: latest


## Other files included:
- inventory
- bootstrap-node.sh
- playbook.yaml
- inventory-test.yaml

## Connecting the dots:
Before you run vagrant up, make sure that you updated the Vagrantfile to your desired configuration. 

Once you are done: 
- _vagrant up_
  Wait for about 6 minutes to finish the build. Once done. You can try to ssh to your ansible-host vm. You can verify this by using "_vagrant status_"

- _vagrant ssh ansible-host_ 
  once you are login to your ansible-host vm, you can now verify if the other vm are reachable. The command to use is: "_ansible-playbook -i inventory playbook/ping.yml_"

## Ansible Testing

## The Vagrantfile performs the following:
- Defines the VM's with static private IP addresses, vcpu, memory and vagrant-box
- Calls "bootstrap-node.sh" which puts IP/hostname information into /etc/hosts. This sets the host specific behavior of the playbook. 
- Calls "ghosts_playbook.yml" to config each box.
