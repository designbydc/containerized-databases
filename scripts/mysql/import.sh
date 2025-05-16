#! /bin/bash
. ./environment.sh
. ./scripts/functions.sh

containerName=$1

# Enable local db settings
docker exec -i $(getContainerName) mysql \
    --defaults-extra-file=${MYSQL_INITDBD_MY_CNF_PATH} \
    -D ${MYSQL_DB_DATABASE} \
    -e "SET GLOBAL local_infile=1" 

# Import SQL data
docker exec -i $(getContainerName) mysql \
    --defaults-extra-file=${MYSQL_INITDBD_MY_CNF_PATH} \
    -D ${MYSQL_DB_DATABASE} \
    < ./share/test_country.sql \
    2>&1 | tee import.log