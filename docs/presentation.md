# Presentation

## Environment composition

This environment provies the following tools to develop in PHP :

### Core

- [PHP](http://php.net)

Available version :

    - `7.0-fpm`
    - `7.1-fpm`
    - `7.2-fpm`
    - `7.0-fpm-alpine`
    - `7.1-fpm-alpine`
    - `7.2-fpm-alpine`

The version is configured in `.env` file. Default: `7.2-fpm`.

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

All of them are in Alpine version

### Tools

#### Database admin

- [MongoExpress](https://github.com/mongo-express/mongo-express) : Manage Mongo database instances
- [PHPMyAdmin](https://www.phpmyadmin.net/) : Manage MySql/MariaDB database instances

#### Mail hub

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
servers:  Start all containers
start:  Start all containers
stop:  Stop all containers
restart:  Restart all containers
certificate:  Generate a SSL certificate
renewal:  Renewal a knowed SSL certificate
install:  Install EnvDev container environment
homepage:  Launch EnvDev homepage in default browser
terminal:  Create a terminal to php container
terminalroot: Create a terminal to php container as root
```

### Optional tools

Optional tools are available to use in EnvDev. They are not included by default but can be added easily.

- [APIGen](https://github.com/ApiGen/ApiGen)  : Documentation for your PHP project

Image container : [`vfac/apigen`](https://hub.docker.com/r/vfac/apigen/)

- [Deployer](https://deployer.org) : Deployment tool for PHP

Image container : [`vfac/deployer`](https://hub.docker.com/r/vfac/deployer/)
