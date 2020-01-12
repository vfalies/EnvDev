#!/bin/bash
source .env

# @echo '******** Starting all containers... ********'
# @docker-compose -f docker-compose.yml -f services/maildev.yml -f services/rabbitmq.yml up -d --build --remove-orphans

CONTAINERS_STRING=""

if [ ${LANGUAGE_SERVER} == "php" ] || [ ${LANGUAGE_SERVER} == "node" ]; then
    CONTAINERS_STRING="${CONTAINERS_STRING} -f services/${LANGUAGE_SERVER}.yml"
fi
if [ ${DB_SERVER} == "mariadb" ] || [ ${DB_SERVER} == "mysql" ] || [ ${DB_SERVER} == 'mongodb' ]; then
    CONTAINERS_STRING="${CONTAINERS_STRING} -f services/${DB_SERVER}.yml"
fi
if [ ${WEB_SERVER} == 'apache' ] || [ ${WEB_SERVER} == 'nginx' ]; then
    CONTAINERS_STRING="${CONTAINERS_STRING} -f services/${WEB_SERVER}.yml"
fi
if [ ${CACHE_SERVER} == 'memcache' ] || [ ${CACHE_SERVER} == 'redis' ]; then
    CONTAINERS_STRING="${CONTAINERS_STRING} -f services/${CACHE_SERVER}.yml"
fi
if [ ${QUEUER_SERVER} == 'rabbitmq' ]; then
    CONTAINERS_STRING="${CONTAINERS_STRING} -f services/${QUEUER_SERVER}.yml"
fi
if [ ${MAIL_SERVER} == 'maildev' ]; then
    CONTAINERS_STRING="${CONTAINERS_STRING} -f services/${MAIL_SERVER}.yml"
fi

start_containers() {
    docker-compose -f docker-compose.yml ${CONTAINERS_STRING} up -d --build --remove-orphans
}

start_containers