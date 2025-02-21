#!/usr/bin/env bash

JAIL="$1"
if [ -z "$JAIL" ]; then
    echo "Usage: $0 <jail_name>"
    exit 1
fi

# restore database
iocage exec "$JAIL" sh -c "pg_restore -c -U postgres -d gitea /postgres_dump/gitea_pg_dump.sql"

# fix potential errors
iocage exec "$JAIL" sh -c "su git -c 'gitea migrate'"
iocage exec "$JAIL" sh -c "su git -c 'gitea admin regenerate keys'"

# print the gitea doctor info
iocage exec "$JAIL" sh -c "su git -c 'gitea doctor check'"
