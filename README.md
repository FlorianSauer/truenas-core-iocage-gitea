# truenas-core-iocage-gitea
Installs the gitea plugin without using the outdated Truenas plugin system

## How to install
run the following command in your terminal:
```bash
git clone https://github.com/FlorianSauer/truenas-core-iocage-gitea.git
# you might need to update the postgres packages set in gitea.json to newer versions
iocage fetch -P ./gitea.json
# after initial jail installation, run the gitea web installer
bash initial_install.sh <gitea jail>
```

## How to migrate
mount this directory on your Truenas Core server: `/postgres_dump`

Then run the following commands in your terminal:
```bash
# write database dump
bash dump_database.sh <old jail>
# restore database dump
bash restore_database.sh <new jail>
```
