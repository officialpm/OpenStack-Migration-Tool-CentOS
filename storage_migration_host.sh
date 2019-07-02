#!/bin/bash
yum install nfs-utils
systemctl enable nfs-server.service
systemctl start nfs-server.service
chown nfsnobody:nfsnobody /var/lib/nova/instances 
chmod 755 /var/lib/nova/instances
systemctl start firewalld
firewall-cmd --permanent --add-port=2049/tcp
firewall-cmd --permanent --add-port=2049/udp
firewall-cmd --permanent --add-port=20048/tcp
firewall-cmd --permanent --add-port=20048/udp
firewall-cmd --permanent --add-service=rpc-bind
firewall-cmd --permanent --add-service=mountd
echo "/var/lib/nova/instances *(rw,sync,fsid=0,no_root_squash)" >> /etc/exports
exportfs -a
