#!/usr/bin/env bash

# the first install of gitea is somehow broken, so we need to fix it manually
# the old /install url was removed and a initial service start with INSTALL_LOCK=false will crash the service
# this script should be run after the initial installation of gitea

JAIL="$1"
if [ -z "$JAIL" ]; then
    echo "Usage: $0 <jail_name>"
    exit 1
fi

# first we need to shut down gitea
iocage exec "$JAIL" sh -c "service gitea stop"

# then we need to run the web installer
echo "Please press CTRL+C when you are finished with the first setup."
echo

iocage exec "$JAIL" sh -c "su git -c 'gitea web'"

# restart the jail
iocage restart "$JAIL"
