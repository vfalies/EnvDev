# Configuration

## Usage

To start the environment, type the following command:

```shell
make servers
```

or

```shell
make start
```

Several containers are created from `.env` configuration:

| Description | Container's name |
|-------------|------------------|
| Maildev hub mail | `maildev` |
| Web server ( Apache or Nginx ) | `web` |
| PHP container | `php` |
| Cache server | `cache` |
| Database server | `db` |
| Database admin tool | `dbadmin` |

You can customize database container name with `.env`'s variable `CONTAINER_DB_NAME`. By default `CONTAINER_DB_NAME` is setted to `db`.

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
</VirtualHost>
```

`/var/www/html/projects` can be defined with `PROJECTS_PATH_DEST` environment variable in `.env` file.

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

You can create `.env` file to manage applications and tools.
An example is available with `.env.dist` file.

The following versions, paths and ports can be configured :

| Description | Variable name | Possible values | Default |
|:-------------|:---------------:|:-----------------:|:---------:|
| PHP Version | PHP_VERSION | `7.0-fpm`, `7.1-fpm`, `7.2-fpm`, `7.0-fpm-alpine`, `7.1-fpm-alpine`, `7.2-fpm-alpine` | `7.2-fpm-alpine` |
| Web Server type | WEB_SERVER | `nginx`, `apache` | `nginx` |
| Web Server version | WEB_SERVER_VERSION | Apache: https://hub.docker.com/r/library/httpd/tags/, Nginx: https://hub.docker.com/r/library/nginx/tags/ | `1.15-alpine` |
| Database type | DB | `mariadb`, `mysql`, `mongodb` | `mysql` |
| Database version | DB_VERSION | Mysql: https://hub.docker.com/r/library/mysql/tags/, MariaDB: https://hub.docker.com/r/library/mariadb/tags/, MongoDB: https://hub.docker.com/r/library/mongo/tags/ | `5.7` |
| Database container name | CONTAINER_DB_NAME | any | `db` |
| Projects Path | PROJECTS_PATH | any | `/your/projects/directory/path` |
| Projects path destination | PROJECTS_PATH_DEST | any | `/var/www/html/projects` |
| HTTP web port | WEB_PORT | any | `80` |
| HTTPS web port | WEBSSL_PORT | any | `443` |
| MailDev port | MAILDEV_PORT | any | `1080` |
| DBAdmin tool port | DBADMIN_PORT | any | `9090` |
| DBAdmin version | DBADMIN_VERSION | Phpmyadmin: https://hub.docker.com/r/phpmyadmin/phpmyadmin/tags/, MongoExpress: https://hub.docker.com/r/library/mongo-express/tags/ | `4.8` |
| Cache server type | CACHE_SERVER | `redis`, `memcached` | `redis` |
| Cache server port | CACHE_PORT | any | `6380` |
| Cache server version | CACHE_VERSION | any | `4.0-alpine` |

If you access to the url `http://envdev.localhost` a page summarizes all projets and propose access link to PHPMyAdmin, MailDev and PHPInfo.
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

To simplify projects source sharing between containers, you can install source projects in the path define in `.env` with variable `PROJECTS_PATH`.

Naturally, you can change the default path. In this case, the default summary will not be available.

The destination path in container is also available with variable `PROJECTS_PATH_DEST` in `.env`.

### PHP Wrapper

A PHP wrapper is available in `wrappers` directory. It can be used, for instance, to IDE integration.