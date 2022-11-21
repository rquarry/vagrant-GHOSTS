
# configure hosts file for our internal network defined by Vagrantfile
cat >> /etc/hosts <<-EOL
# vagrant environment nodes
192.168.56.3  ghostserver.demo.com
192.168.56.10 ghostclient1.demo.com
