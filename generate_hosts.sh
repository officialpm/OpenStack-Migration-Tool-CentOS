#!/bin/bash
no_lines=$(<config.csv wc -l)
for ((line=1; line<=no_lines; line++)); do
  IFS=","
  read -ra access << $(sed "${line}q;d" config.csv)
  $ip_ad=$(echo ${access[2]} | cut -d '/' -f 1)
  $hostn=${access[3]}
  sudo cp /etc/hosts /etc/hosts_old
  sudo printf "$ip_ad\t$hostn\n" >> /etc/hosts
  IFS=" "
done
