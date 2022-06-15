FROM postgres:13.7

COPY ./setup-master.sh /docker-entrypoint-initdb.d/setup-master.sh
RUN chmod 0777 /docker-entrypoint-initdb.d/setup-master.sh