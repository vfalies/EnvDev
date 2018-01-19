# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## Unreleased

### Added

- Share git config & ssh keys
- Add ENVDEV_HOME_PATH variable in environment file to differenciate PROJECTS_PATH
- Add `envdev` vhost configuration for Apache & Nginx

### Changed

- Rename conf/apache/vhost directory to conf/apache/vhosts

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