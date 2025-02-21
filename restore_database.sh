#!/usr/bin/env bash

JAIL="$1"
if [ -z "$JAIL" ]; then
    echo "Usage: $0 <jail_name>"
    exit 1
fi

iocage exec "$JAIL" sh -c "psql -U postgres -d gitea -f /postgres_dump/gitea_pg_dump.sql"