#!/bin/bash

source $1
ENV_FILE=$1

CONTAINERS_STRING=""

if [ "${LANGUAGE_SERVER}" = "php" -o "${LANGUAGE_SERVER}" = "node" ]; then
    CONTAINERS_STRING="${CONTAINERS_STRING} -f services/${LANGUAGE_SERVER}.yml"
fi
if [ "${DB_SERVER}" = "mariadb" -o "${DB_SERVER}" = "mysql" -o "${DB_SERVER}" = 'mongodb' ]; then
    CONTAINERS_STRING="${CONTAINERS_STRING} -f services/${DB_SERVER}.yml"
fi
if [ "${WEB_SERVER}" = 'apache' -o "${WEB_SERVER}" = 'nginx' ]; then
    CONTAINERS_STRING="${CONTAINERS_STRING} -f services/${WEB_SERVER}.yml"
fi
if [ "${CACHE_SERVER}" = 'memcached' -o "${CACHE_SERVER}" = 'redis' ]; then
    CONTAINERS_STRING="${CONTAINERS_STRING} -f services/${CACHE_SERVER}.yml"
fi
if [ "${QUEUER_SERVER}" = 'rabbitmq' ]; then
    CONTAINERS_STRING="${CONTAINERS_STRING} -f services/${QUEUER_SERVER}.yml"
fi
if [ "${MAIL_SERVER}" = 'maildev' ]; then
    CONTAINERS_STRING="${CONTAINERS_STRING} -f services/${MAIL_SERVER}.yml"
fi

start_containers() {
    cp ${ENV_FILE} ./.env
    docker-compose -f docker-compose.yml ${CONTAINERS_STRING} up -d --build --remove-orphans --force-recreate
}
start_containers