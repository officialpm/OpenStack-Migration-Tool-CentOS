
# OpenStack-Migration-Tool-CentOS
### Notes

- INITIAL step **"bash setup.sh"**
- Please ensure that no host's admin account has a password containing a comma (",") as this is used as a delimiter.
- The environment setup involves reconfiguring networking which can break an SSH session. Be prepared to access hosts locally.
- Hostnames must be unique for identification purposes.
----
### Steps

- For each physical host to be part of the OpenStack cluster, ensure that you log in as a user with admin privileges (a sudoer).

> *IMPORTANT: It is STRONGLY recommended that the password of said user on every machine is changed into a temporary one for security purposes.
This can then be changed back post-configuration.*

- On **any machine**, and from the directory in which this file is contained, run init.sh.
This is done in terminal as follows:

```bash
    ./init.sh
```

-  On every host, run env_setup.sh:

```bash
./env_setup.sh
```

> IMPORTANT: From step 3 onwards, invocation of a script will fail if the generated config.csv is not in the same folder.



-  Run the following script on the node you want to migrate from

```bash
./storage_migration_host.sh
```

-  On every other node, run the following command:

```bash
export nfsserverhost=[insert hostname]
```
> Entering the hostname / IP Address of the NFS server where instructed (without []s).

Then, run the following script on the node you want migrate to:

```bash
./storage_migration_client.sh
```
---
Tool Modified 
[Parth Maniar](https://github.com/officialpm)
