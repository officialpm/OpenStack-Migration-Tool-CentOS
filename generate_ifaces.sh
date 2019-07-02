#!/bin/bash
touch interfaces
export inface=$(ip a | grep 2: | cut -d' ' -f 2 | cut -d ':' -f 1)
echo "auto $inface" >> interfaces
echo "iface $inface inet manual" >> interfaces
echo "up ip link set dev \$IFACE up" >> interfaces
echo "down ip link set dev \$IFACE down" >> interfaces
sudo cat interfaces >> /etc/sysconfig/network-scripts/ifcfg-ens33