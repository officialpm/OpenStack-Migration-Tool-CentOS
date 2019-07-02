#!/bin/sh
if [ -f "config.csv" ]; then
  echo "Override previous configuration? (y/n)"
  read resp
  if [ $resp == "y" ]; then
    rm config.csv
  else
    exit 0
  fi
fi
echo "Enter the number of hosts to enrol into an OpenStack cluster."
read no_hosts
counter=0
controller_set=false
while [ $counter -lt $no_hosts ]
do
  echo "Enter the admin username for host $((counter+1))."
  read resp
  printf "${resp}," >> config.csv
  echo "Enter the admin password for host $((counter+1))."
  read -s resp
  printf "${resp}," >> config.csv
  echo "Enter the IP address of host $((counter+1))."
  read resp
  printf "${resp}," >> config.csv
  echo "Enter the hostname of host $((counter+1))."
  read resp
  printf "${resp}," >> config.csv
  if [ $controller_set = false ]; then
    echo "Enter whether host $((counter+1)) will be the controller. (y/n)"
    read resp
    if [ $resp == "y" ]; then
      printf "controller\n" >> config.csv
      controller_set=true
    else
      printf "compute\n" >> config.csv
    fi
  else
    printf "compute\n" >> config.csv
  fi
  ((counter++))
done
if [ ! -f "resolvconf.deb" ]; then
  yum install wget
  wget -O resolvconf.deb "http://archive.ubuntu.com/ubuntu/pool/universe/r/resolvconf/resolvconf_1.79ubuntu10_all.deb"
fi
echo
echo "Configuration saved."
echo "Please ensure that config.csv is in the same folder as any script you run at any time, on any server."
