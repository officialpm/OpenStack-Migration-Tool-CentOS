#!/bin/bash
yum install nfs-utils
sudo echo "$nfsserverhost:/var/lib/nova/instances /var/lib/nova/instances nfs4 defaults 0 0" >> /etc/fstab
mount $nfsserverhost:/var/lib/nova/instances /var/lib/nova/instances
sudo mount -a -v
