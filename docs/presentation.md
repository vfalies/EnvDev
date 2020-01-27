# Presentation

## Environment composition

This environment provides the following tools to develop in PHP or in NodeJS via profiles.

### Core

- [PHP](http://php.net)

Available version :

    - `7.0-fpm`
    - `7.1-fpm`
    - `7.2-fpm`
    - `7.3-fpm`
    - `7.4-fpm`
    - `7.0-fpm-alpine`
    - `7.1-fpm-alpine`
    - `7.2-fpm-alpine`
    - `7.3-fpm-alpine`
    - `7.4-fpm-alpine`

Default: `7.4-fpm`.

- [Node](https://nodejs.org/)

Available version :

    - `10.18`
    - `12.14`
    - `13.6`

Default: `13.6`

- Database

Two different database are available :

- [MySQL](https://www.mysql.com)
- [MongoDB](https://www.mongodb.com)

The database wished is configured in `.env` file. Default: `mysql`

- Web server

Two web server are available :

- [Nginx](https://nginx.org)
- [Apache](https://httpd.apache.org/)

All of them are in Alpine version.

- Cache server

Two cache server are available :

- [Redis](https://redis.io/)
- [Memcached](https://memcached.org/)

- Queuer server

- [RabbitMQ](https://www.rabbitmq.com/)

All of them are in Alpine version

### Tools

#### Database admin

- [MongoExpress](https://github.com/mongo-express/mongo-express) : Manage Mongo database instances
- [PHPMyAdmin](https://www.phpmyadmin.net/) : Manage MySql/MariaDB database instances

#### Mail catcher

- [MailDev](http://danfarrelly.nyc/MailDev) : SMTP Server + Web Interface for viewing and testing emails during development

#### Composer

- [Composer](https://getcomposer.org) : Dependency Manager for PHP

#### NodeJs

- [NodeJs](https://nodejs.org/en) : JavaScript runtime

#### Npm

- [Npm](https://www.npmjs.com/) : Package manager

#### Grunt

- [Grunt](https://gruntjs.com/) : Javascript task runner

#### Gulp

- [Gulp](https://gulpjs.com/) : Javascript task runner

#### Yarn

- [Yarn](https://yarnpkg.com/en/) : Package manager

#### Makefile

A `Makefile` is available in command line to manage several actions.

Type following command to display help :

```shell
make
```

or

```shell
make help
```

Output:

```shell
help:  Show this help
envdev:  Get EnvDev version
profile:  Create new profile
delete:  Delete profile
run:  Run a profile
servers:  Start default containers
start:  Start default containers
stop:  Stop all running containers
certificate:  Generate a SSL certificate
renewal:  Renewal a knowed SSL certificate
homepage:  Launch EnvDev homepage in default browser
terminal:  Create a terminal on PHP container
terminalroot:  Create a terminal on PHP container as root
```

### Optional tools

Optional tools are available to use in EnvDev. They are not included by default but can be added easily.

- [APIGen](https://github.com/ApiGen/ApiGen)  : Documentation for your PHP project

Image container : [`vfac/apigen`](https://hub.docker.com/r/vfac/apigen/)

- [Deployer](https://deployer.org) : Deployment tool for PHP

Image container : [`vfac/deployer`](https://hub.docker.com/r/vfac/deployer/)
