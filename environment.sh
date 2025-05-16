#! /bin/bash
. .env

MYSQL_INITDBD_MY_CNF_PATH="/root/.my.cnf"

MYSQL_DEFAULTS_GROUP_SUFFIX="WORK"
MYSQL_CONNECT_CMD="mysql --defaults-group-suffix=${MYSQL_DEFAULTS_GROUP_SUFFIX}"
MYSQL_ADMIN_PING_CMD="mysqladmin --defaults-group-suffix=${MYSQL_DEFAULTS_GROUP_SUFFIX} --silent ping"