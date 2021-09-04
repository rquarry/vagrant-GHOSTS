
# configure hosts file for our internal network defined by Vagrantfile
cat >> /etc/hosts <<-EOL
# vagrant environment nodes
192.168.29.3  ghostserver.demo.com
192.168.29.4  ansible-host
