## Environment composition

This environment provies the following tools to develop in PHP :

### Core
- [PHP 7.1](http://php.net)
- [MySQL](https://www.mysql.com)
- [MongoDB](https://www.mongodb.com)
- [Nginx](https://nginx.org)

### Tools
- [MongoExpress](https://github.com/mongo-express/mongo-express) : Manage Mongo database instances
- [PHPMyAdmin](https://www.phpmyadmin.net/) : Manage Mongo database instances
- [MailDev](http://danfarrelly.nyc/MailDev) : SMTP Server + Web Interface for viewing and testing emails during development
- [APIGen](https://github.com/ApiGen/ApiGen)  : Documentation for your PHP project
- [Deployer](https://deployer.org) : Deployment tool for PHP
- [Composer](https://getcomposer.org) : Dependency Manager for PHP
- [NodeJs](https://nodejs.org/en) : JavaScript runtime

## Requirements

Two system dependencies are required :
- Docker
- Docker Compose

## Installation

```
$ git clone git@github.com:vfalies/EnvDev.git
```

## Usage

To start the environment, type the following command :

```
$ docker-compose up
```

Shortcuts can be declared to use all tools of the environment development with the command :

```
source .bash_aliases
```

Every shortcut launch the correct container.

## Configuration

You can modify `.env` file to manage path and port of the application and tools.
The follwing paths and ports can be configured :

- HTTP port (WEB_PORT) default 80
- MailDev port (MAILDEV_PORT) default 1080
- PHPMyAdmin port (PHPMYADMIN_PORT) default 9090
- MongoExpress port (MONGOEXPRESS_PORt) default 8081
- Projects Path (PROJECTS_PATH) default `./projects`

If you access to the url `http://localhost` a page summarizes all projets and propose access to PHPMyAdmin, MailDev and PHPInfo.

## Open source

EnvDev is licensed under the MIT License and published through [GitHub](https://github.com/vfalies/envdev/blob/master/LICENSE)
