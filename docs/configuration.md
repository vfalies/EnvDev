# Configuration

## Usage

To create a new environment, type the following command:

```shell
make profile
```

To start the environment, type the following command:

For default configuration

```shell
make servers
```

For specific configuration

```shell
make run
```

Several containers are created from profile configuration:

| Description                    | Container's name |
| ------------------------------ | ---------------- |
| Maildev hub mail               | `maildev`        |
| Web server ( Apache or Nginx ) | `web`            |
| PHP or Node container          | `base`           |
| Cache server                   | `cache`          |
| Database server                | `db`             |
| Database admin tool            | `dbadmin`        |
| Queuer server                  | `queuer`         |

You can customize database container name with profile's variable `CONTAINER_DB_NAME`. By default `CONTAINER_DB_NAME` is setted to `db`.

`composer` is available through `php` container:

```shell
docker exec php composer -v
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
        fastcgi_pass   base:9000;
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
</VirtualHost>
```

`/var/www/html/projects` can be defined with `PROJECTS_PATH_DEST` environment variable in profile file in `profiles` directory.

### SSL support

The SSL support is possible during development. To activate it on one of your vhosts, you must follow steps:

- Create the SSL self-signed certificate

you can use the command:

```shell
make certificate
```

- Add the activation of SSL in VHost file

On Nginx:

```shell
    listen 443 ssl;

    ssl_certificate /etc/nginx/ssl/envdev.crt;
    ssl_certificate_key /etc/nginx/ssl/envdev.key;
```

On Apache:

```shell
<VirtualHost *:80 *:443>
    ...

    SSLEngine on
    SSLCertificateFile /usr/local/apache2/conf/custom/envdev.crt
    SSLCertificateKeyFile /usr/local/apache2/conf/custom/envdev.key

    ...
```

where `envdev` is the name chosen during the step of the certificate creation.

Don't forget to restart `web` container to restart the web server

```shell
docker restart web
```

Tips: If you certificate is out of date, you can renew it with the command:

```shell
make renewal
```

## Customization

You can create profile file to manage applications and tools with the command:

```shell
make profile
```

The following versions, paths and ports can be configured :

| Description                      |   Variable name    |                                                                               Possible values                                                                               |             Default             |
| :------------------------------- | :----------------: | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------: | :-----------------------------: |
| Language                      |    LANGUAGE_SERVER     |                                            `php`, `node`                                            |        N/A         |
| Language Version                      |    BASE_VERSION     |                                            `7.0-fpm`, `7.1-fpm`, `7.2-fpm`, `7.0-fpm-alpine`, `7.1-fpm-alpine`, `7.2-fpm-alpine`, `7.3-fpm`, `7.3-fpm-alpine`, `7.4-fpm`, `7.4-fpm-alpine`, `13.6`, `12.14`, `10.18`                                            |        `7.4-fpm` for PHP, `13.6` for Node         |
| Language Static Container IP          |   BASE_STATIC_IP    |                                                                               172.16.238.0/24                                                                               |          172.16.238.12          |
| Web Server type                  |     WEB_SERVER     |                                                                              `nginx`, `apache`                                                                              |             `nginx`             |
| Web Server version               |    WEB_VERSION     |                               [Apache](https://hub.docker.com/r/library/httpd/tags/) / [Nginx](https://hub.docker.com/r/library/nginx/tags/)                                |          `1.15-alpine`          |
| Web Server Static Container IP   |   WEB_STATIC_IP    |                                                                               172.16.238.0/24                                                                               |          172.16.238.14          |
| Database type                    |     DB_SERVER      |                                                                        `mariadb`, `mysql`, `mongodb`                                                                        |             `mysql`             |
| Database version                 |     DB_VERSION     | [Mysql](https://hub.docker.com/r/library/mysql/tags/) / [MariaDB](https://hub.docker.com/r/library/mariadb/tags/) / [MongoDB](https://hub.docker.com/r/library/mongo/tags/) |              `5.7`              |
| Database container name          | CONTAINER_DB_NAME  |                                                                                     any                                                                                     |              `db`               |
| Database Static Container IP     |    DB_STATIC_IP    |                                                                               172.16.238.0/24                                                                               |          172.16.238.13          |
| Projects Path                    |   PROJECTS_PATH    |                                                                                     any                                                                                     | `/your/projects/directory/path` |
| Projects path destination        | PROJECTS_PATH_DEST |                                                                                     any                                                                                     |    `/var/www/html/projects`     |
| HTTP web port                    |      WEB_PORT      |                                                                                     any                                                                                     |              `80`               |
| HTTPS web port                   |    WEBSSL_PORT     |                                                                                     any                                                                                     |              `443`              |
| MailDev port                     |    MAILDEV_PORT    |                                                                                     any                                                                                     |             `1080`              |
| MailDev Static Container IP      | MAILDEV_STATIC_IP  |                                                                               172.16.238.0/24                                                                               |          172.16.238.10          |
| DBAdmin tool port                |    DBADMIN_PORT    |                                                                                     any                                                                                     |             `9090`              |
| DBAdmin version                  |  DBADMIN_VERSION   |                  [Phpmyadmin](https://hub.docker.com/r/phpmyadmin/phpmyadmin/tags/) / [MongoExpress](https://hub.docker.com/r/library/mongo-express/tags/)                  |              `4.8`              |
| DBAdmin Static Container IP      | DBADMIN_STATIC_IP  |                                                                               172.16.238.0/24                                                                               |          172.16.238.11          |
| Cache server type                |    CACHE_SERVER    |                                                                            `redis`, `memcached`                                                                             |             `redis`             |
| Cache server port                |     CACHE_PORT     |                                                                                     any                                                                                     |             `6380`              |
| Cache server version             |   CACHE_VERSION    |                                                                                     any                                                                                     |          `4.0-alpine`           |
| Cache server Static Container IP |  CACHE_STATIC_IP   |                                                                               172.16.238.0/24                                                                               |          172.16.238.15          |
| Queuer server                    |   QUEUER_SERVER    |                                                                                 `rabbitmq`                                                                                  |           `rabbitmq`            |
| Queuer server port               |    QUEUER_PORT     |                                                                                     any                                                                                     |             `15672`             |
| Queuer Static Container IP       |  QUEUER_STATIC_IP  |                                                                               172.16.238.0/24                                                                               |          172.16.238.16          |

If you access to the url `http://envdev.localhost` a page summarizes all projets and propose access link to tools (PHPMyAdmin, MailDev, PHPInfo).
This page is also available with command :

```shell
make homepage
```

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

To simplify projects source sharing between containers, you can install source projects in the path define in `profiles` directory with variable `PROJECTS_PATH`.

Naturally, you can change the default path. In this case, the default summary will not be available.

The destination path in container is also available with variable `PROJECTS_PATH_DEST` in `profiles` directory.

### Wrappers

Wrappers are available in `wrappers` directory.

They can be used, for instance, to IDE integration.

- PHP wrapper
- Node wrapper
- Git wrapper
- Composer wrapper
- Grunt wrapper
- Gulp wrapper
- Npm wrapper
- Yarn wrapper
- Typescript wrapper
