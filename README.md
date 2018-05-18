# EnvDev

## Environment composition

This environment provies the following tools to develop in PHP :

### Core

- [PHP](http://php.net)

Available version :

    - `7.0`
    - `7.1`
    - `7.2`

The version is configured in `.env` file. Default: `7.2`
PHP Stack run on Alpine version to keep a small size image.

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
- [PHPMyAdmin](https://www.phpmyadmin.net/) : Manage Mongo database instances

#### Mail hub

- [MailDev](http://danfarrelly.nyc/MailDev) : SMTP Server + Web Interface for viewing and testing emails during development

#### Composer

- [Composer](https://getcomposer.org) : Dependency Manager for PHP

#### NodeJs

- [NodeJs](https://nodejs.org/en) : JavaScript runtime

### Optional tools

Optional tools are available to use in EnvDev. They are not included by default but can be added easily.

- [APIGen](https://github.com/ApiGen/ApiGen)  : Documentation for your PHP project

Image container : [`vfac/apigen`](https://hub.docker.com/r/vfac/apigen/)

- [Deployer](https://deployer.org) : Deployment tool for PHP

Image container : [`vfac/deployer`](https://hub.docker.com/r/vfac/deployer/)

## Requirements

Two system dependencies are required :

- Docker
- Docker Compose

## Installation

```shell
git clone git@github.com:vfalies/EnvDev.git
```

Create a `.env` file to define your configuration.
An example is available with `.env.dist` file.

To install environment

```shell
make install
```

## Usage

To start the environment, type the following command:

```shell
make servers
```

Several containers are created from `.env` configuration:

| Description | Container's name |
|-------------|------------------|
| Maildev hub mail | `maildev` |
| NodeJs | `nodejs` |
| Web server ( Apache or Nginx ) | `web` |
| PHP container | `php` |
| Cache server | `cache` |
| Database server | `db` |
| Database admin tool | `dbadmin` |

`composer` is available through `php` container:

```shell
docker exec php composer -v
```

`node`, `npm` are available through `node` container:

```shell
docker run --rm node node -v
```

```shell
docker run --rm node npm -v
```

To open default home page in browser

```shell
make homepage
```

### Hosts

You can add your own hosts file for all your projects.

With NGinx

In `conf/nginx/vhosts` directory, all your `yourhost.conf` file. A default host file is available for example : `/conf/nginx/vhosts/default.conf`.

```conf
server {

    listen 80;
    server_name localhost;
    root /var/www/html;
    index index.php index.html index.htm;

    location ~* \.PHP$ {
        fastcgi_index   index.php;
        fastcgi_pass   php:9000;
        include         fastcgi_params;
        fastcgi_param   SCRIPT_FILENAME    $document_root$fastcgi_script_name;
    }

}
```

With Apache

In `conf/apache/vhosts` directory, all your `yourhost.conf` file. A default host file is available for example : `/conf/apache/vhosts/default.conf`.

```conf
<VirtualHost *:80>
    ServerName localhost
    DocumentRoot /var/www/html/projects

    <Directory /var/www/html/projects>
        Require all granted
    </Directory>

    <FilesMatch \.php$>
        SetHandler "proxy:fcgi://php:9000"
    </FilesMatch>
</VirtualHost>
```

### SSL support

The SSL support is possible during development. To activate it on one of your vhosts, you must follow steps:

- Create the SSL self-signed certificate

you can use the command:

```shell
make certificate_creation
```

- Add the activation of SSL in VHost file

On Nginx:

```
    listen 443 ssl;
    ssl on;
    ssl_certificate /etc/nginx/ssl/envdev.crt;
    ssl_certificate_key /etc/nginx/ssl/envdev.key;
```

where `envdev` is the name chosen during the step of the certificate creation.

Don't forget to restart `web` container to restart the web server

```shell
docker restart web
```

Tips: If you certificate is out of date, you can regenerate it with the command: 

```shell
make certificate_regeneration
```

## Configuration

You can create `.env` file to manage applications and tools.
An example is available with `.env.dist` file.

The following versions, paths and ports can be configured :

| Description | Variable name | Possible values | Default |
|:-------------|:---------------:|:-----------------:|:---------:|
| PHP Version | PHP_VERSION | `7.0`, `7.1`, `7.2` | `7.2` |
| Database type | DB | `mariadb`, `mysql`, `mongodb` | `mysql` |
| Cache server type | CACHE_SERVER | `redis`, `memcached` | `redis` |
| Projects Path | PROJECTS_PATH | any | `/your/projects/directory/path` |
| HTTP web port | WEB_PORT | any | `80` |
| MailDev port | MAILDEV_PORT | any | `1080` |
| PHPMyAdmin port | PHPMYADMIN_PORT | any | `9090` |
| MongoExpress port | MONGOEXPRESS_PORT | any | `8081` |
| Cache server port | CACHE_PORT | any | `6380` |

If you access to the url `http://envdev.localhost` a page summarizes all projets and propose access link to PHPMyAdmin, MailDev and PHPInfo.

### Nginx configuration

Nginx configuration file is available at `/conf/nginx/nginx.conf` to custom the web server configuration.

### Apache configuration

Apache configuration file is available at `/conf/apache/httpd.conf` to custom the web server configuration.

### PHP configuration

A custom php.ini file is available at `/conf/php/php.ini`. The default PHP configuration is with these options:

```conf
date.timezone = Europe/Paris
display_errors=1
error_reporting=E_ALL
log_errors = on
error_log = /var/log/php_errors.log
memory_limit = 256M
upload_max_filesize = 200M
post_max_size = 40M
```

### Projects configuration

To simplify projects source sharing between containers, you can install source projects in the path define in `.env` with variable `PROJECTS_PATH`.

Naturally, you can change the default path. In this case, the default summary will not be available.

## Open source

EnvDev is licensed under the MIT License and published through [GitHub](https://github.com/vfalies/envdev/blob/master/LICENSE)
