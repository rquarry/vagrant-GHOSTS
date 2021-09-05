# Ansible Environment:

Multi-Machine Vagrant Environments:
This Vagrantfile will create 2 Ubuntu 20.04 VM's:

* ghostserver.demo.com - Host running Cargenie Mellon's GHOSTS NPC automation platform
* ghostclient1.demo.com - Host with ASP.NET Core Runtime installed. Pending playbook additions for Cargenie Mellon's GHOSTS NPC Linux client.


## Requirements:

* Internet connection is a must!
* Make sure the VT support is enabled on your BIOS
* Vagrant - 1.9.x or higher
* Vagrant plugins - vagrant-proxyconf - needed if you are running behind proxy
* Ansible: latest
* Virtualbox: latest


## Other files included:
- inventory (unused)
- bootstrap-node.sh - sets hostname in /etc/hosts for each client
- ghostserver_playbook.yaml - Uses docker compose to setup GHOSTS server
- ghostclient_playbook.yaml - (Installs ASP.NET Core Runtime)[https://docs.microsoft.com/en-us/dotnet/core/install/linux-ubuntu#2004-]
- inventory-test.yaml - Not sure what this if for?

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
- Calls playbooks depending on the "config.vm.define" directives in lines  58 - 73 of the Vagrant file. 
