#!/bin/bash

# Default profile
default='php7nginx'

profile=''
if [ -z $1 ]
  then
    profile=$default
  else
    profile=$1
fi

echo Starting containers...

docker-compose down --remove-orphans

case $profile in
'php7nginx')
    echo 'Profile: PHP 7.0 FPM with NGinx web server'
    docker-compose \
      -f docker-compose.yml \
      -f docker/nginx/docker-compose.nginx.yml \
      -f docker/php7fpm/docker-compose.php7fpm.yml \
      up --build -d
    ;;
'php7apache')
    echo 'Profile: PHP 7.0 module with Apache 2 web server'
    docker-compose \
      -f docker-compose.yml \
      -f docker/php7apache/docker-compose.php7apache.yml \
      up --build -d
    ;;
'php5.6nginx')
    echo 'Profile: PHP 5.6 FPM with NGinx web server'
    docker-compose \
      -f docker-compose.yml \
      -f docker/nginx/docker-compose.nginx.yml \
      -f docker/php5.6fpm/docker-compose.php5.6fpm.yml \
      up --build -d
    ;;
'help')
  echo 'Web development environment'
  echo ''
  echo 'Possible profiles :'
  echo '  - php7nginx : PHP 7.0 FPM with NGinx web server'
  echo '  - php7apache : PHP 7.0 module with Apache 2 web server'
  echo '  - php5.6nginx : PHP 5.6 FPM with NGinx web server'
  echo ''
  echo 'Usage : ./start.sh <profile name>'
  exit
  ;;
*)
  echo "Unknown profile $profile"
  echo ''
  echo 'Type "./start.sh help" for a list of available profiles'
  exit
  ;;
esac

echo Containers started
