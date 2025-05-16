#! /bin/bash
. ./environment.sh
. ./scripts/functions.sh

containerName=$1

WAIT_MAX=5
retryCount=0

until docker exec -it $(getContainerName) sh -c "${MYSQL_ADMIN_PING_CMD}" > /dev/null 2>&1 ; do
    if [ ${retryCount} -ge ${WAIT_MAX} ]; then
        echo "[ERROR] could not connect to mysql"
        exit 1
    fi
    sleep 1
    retryCount=$(expr ${retryCount} + 1)
    echo "[$(printf "%02d\n" ${retryCount})/${WAIT_MAX}] waiting for running..."
done

docker exec -it $(getContainerName) mysql \
    --defaults-extra-file=${MYSQL_INITDBD_MY_CNF_PATH} \
    -D ${MYSQL_DB_DATABASE}