#!/bin/bash
yum install dos2unix
chmod u+x init.sh
chmod u+x generate_hosts.sh
chmod u+x generate_ifaces.sh
chmod u+x storage_migration_client.sh
chmod u+x storage_migration_host.sh
chmod u+x env_setup.sh
dos2unix init.sh
dos2unix generate_hosts.sh
dos2unix generate_ifaces.sh
dos2unix storage_migration_client.sh
dos2unix storage_migration_host.sh
dos2unix env_setup.sh
