#!/bin/bash
echo "host all all 0.0.0.0/0 md5" >>"$PGDATA/pg_hba.conf"


set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    create table people(id int, name varchar(50));
    create publication people_publication for table people;
    insert into people (id, name) values (10, 'Alex'), (11, 'Stepan');
EOSQL


cat >> ${PGDATA}/postgresql.conf <<EOF
wal_level = logical
archive_mode = on
archive_command = 'cd .'
max_wal_senders = 4
wal_keep_size = 128
EOF