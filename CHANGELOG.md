# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [2.3] - 2018-07-14

### Changed

- Change default version of PHP in `.env.dist` file from 7.2 FPM alpine to 7.2 FPM
- Change License date
- Update README

### Added

- Add JS Tools : NodeJS, Npm, Grunt, Gulp, Yarn
- Add Bash in alpine versions
- Add PHP wrapper to, for instrane, IDE integration

## [2.2.1] - 2018-06-19

### Added

- Add make action terminal to create a ssh access to php container
- Add make action terminal to create a ssh access to php container as root

### Changed

- Fix Nginx & Apache vhost detection on homepage
- Update README
- Fix Apache loaded module

## [2.2] - 2018-05-26

### Added

- Add SSL support
- Add script to create and renew self-signed certificate
- Add EnvDev version on homepage

### Changed

- Update Makefile actions and add help
- Fix CSS homepage

## [2.1.1] - 2018-05-01

### Added

- Add Servers informations on homepage
- Add Vhosts informations on homepage
- Add Vhosts interpretation on homepage to open defined hostname by project

## [2.1] - 2018-04-05

### Added

- Share git config & ssh keys
- Add `envdev` vhost configuration for Apache & Nginx
- Rename `projects` directory to `home`
- Add ``.env.dist` configuration example
- Add Makefile
- Use current UID & GID in container
- Add Make action "stop" to stop all containers
- Add Make action "homepage" to open envdev.localhost in default browser

### Changed

- Rename conf/apache/vhost directory to conf/apache/vhosts
- Update working directory for PHP container
- Change PHP image
- Refactoring Home page
- Set docker-compose make action with detached mode

### Deleted

- Remove NodeJs container (already include in PHP image)

## [2.0] - 2017-12-20

### Added

- Add cache stack : redis or memcached

### Changed

- Refactoring docker-compose
- Change PHP stack based on Alpine container
- Set default PHP version to 7.2

### Removed

- Remove Apigen container
- Remove Deployer container
- Remove bash_aliases file
