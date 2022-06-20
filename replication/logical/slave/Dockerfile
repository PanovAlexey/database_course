FROM postgres:13.7

RUN apt-get update && apt-get install -y iputils-ping
COPY ./setup-slave.sh /docker-entrypoint-initdb.d/setup-slave.sh
RUN chmod 0777 /docker-entrypoint-initdb.d/setup-slave.sh