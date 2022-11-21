# Ansible Environment:

Multi-Machine Vagrant Environments:
This Vagrantfile will creates VMs to demonstrate (Cargenie Mellon's GHOSTS NPC automation platform)[https://github.com/cmu-sei/GHOSTS]

* ghostserver.demo.com - Ubuntu Host running GHOSTS server using the docker-compose.yml file from the project
* ghostclient1.demo.com - Host with ASP.NET Core Runtime installed. Pending playbook additions for Cargenie Mellon's GHOSTS NPC Linux client.


## Host Requirements:
* An Internet connection
* Vagrant
* Ansible 
* Virtualbox


## Other files included:
- inventory-test.yml (unused): Ansible inventory file from original forked repo. Kept for reference
- bootstrap-node.sh - sets hostname in /etc/hosts for each client
- ghostserver_playbook.yaml - Uses docker compose to setup GHOSTS server
- ghostLinuxClient_playbook.yaml - Installs ASP.NET Core Runtime)[https://docs.microsoft.com/en-us/dotnet/core/install/linux-ubuntu#2004-], enables auto-login.

## Issues
- The CMU binaries are provided from a box.com account that cannot be directly linked for the download. (Binaries must be downloaded)[https://github.com/cmu-sei/GHOSTS/wiki/Installation-from-distribution-binaries] into the repo root folder to be pushed up to the clients at build time.
- The linux client (possibly the box being used) has issues with the host-only "private_network" which it assigns as eth1. Vagrant always makes eth0 a NAT adapter. The config in the Vagrant file activates eth1 and leaves eth0 disabled which causes vagrant not to be able to communicate via ssh and timeout during the build. Setup can be completed by activating eth0 using NetworkManager on the desktop.

## To-Do
- Look more at automating the install of Grafana
- Update windows client to extract ghosts, setup the config, and edit the registry to auto start.
