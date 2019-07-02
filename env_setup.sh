#!/bin/bash
if [ ! -f "config.csv" ]; then
  echo "No configuration file found. Please run init.sh again."
  sleep 3
  exit 1
elif [ ! -f "resolvconf.deb" ]; then
  echo "resolvconf package not found. Please run init.sh again."
  sleep 3
  exit 1
fi
./generate_ifaces.sh
./generate_hosts.sh
export hostn=$(hostname) # use to identify host
done
export hostn=$(hostname)
