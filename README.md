# Pré-Requis

Les pré-requis sur la machine hôte sont les suivants :

- [docker](https://www.docker.com/products/overview)
- [docker-compose](https://docs.docker.com/compose/install/)

## Windows

Windows 7 ou plus récent avec le support de la virtualisation.
Télécharger [Docker Toolbox](https://www.docker.com/toolbox) pour permettre l'utilisation de docker.

Attention, les fichiers devant être partagés avec la machine virtuelle doivent impérativement être déposé dans le Home utilisateur :

- `C:/Users/[NomUtilisateur]/`

### Git sous Windows

La configuration de GIT suivante est nécessaire sous Windows pour le bon fonctionnement des containers :

```
git config core.autocrlf false
```

Sans la conservation des caractères de fin de ligne unix, des comportements anormaux peuvent être rencontrés.

### Démarrage

Il est possible que la résolution des chemins sous Windows pose problème. Pour éviter cela, modifier de la manière suivante toutes les occurences suivantes dans le fichier `start.sh`:

```
docker-compose \
```

par

```
COMPOSE_CONVERT_WINDOWS_PATHS=1 docker-compose \
```

# Installation

Plusieurs scripts sont a disposition pour facilité l'utilisation courante des containers.

- start.sh

Lance le build, puis le démarrage de l'environnement de développement.

Par défaut, le profile PHP 7 FPM avec Nginx est lancé. Pour visualiser les profiles possibles, lancer la commande suivante :

```
./start.sh help
```

- stop.sh

Arrête l'ensemble des containers et les supprime.

- .bash_aliases

Permet de créer les alias nécessaires à l'utilisation des outils suivants :

  - PHP
  - composer
  - bower
  - grunt
  - gulp
  - nodejs
  - npm

Pour installer ces alias, utiliser une des commandes suivantes :

de manière temporaire :

```
source .bash_aliases
```

de manière permanente :

```
echo .bash_aliases >> ~/.bash_aliases
```

# Utilisation

Sous Windows, `localhost` devra être remplacé par l'adresse IP de la machine virtuelle Docker Toolbox.

## Accès web

L'utilisation du serveur web se fait par défaut via le port 81.

```
http://localhost:81
```

Un phpinfo() est disponible à l'adresse :

```
http://localhost:81/phpinfo.php
```

Ce port est modifiable via le fichier `.env` à la racine en changeant la variable `WEB_PORT`.

A noter que pour les VHOST toutes les sources déposées dans `projects` sont montées dans le répertoire `/var/www/html`.

Le répertoire `projects` où sont déposées les sources est paramétrable dans le fichier `.env` en changeant la variable `PROJECTS_PATH`.

## Maildev

L'outil Maildev permettant de développer de manière les mails avec un serveur de mails local est disponible à l'adresse :

```
http://localhost:1080
```

Le port 1080 est modifiable via le fichier `.env` à la racine en changeant la variable `MAILDEV_PORT`.

## PhpMyAdmin

PhpMyAdmin est disponible via le port 8080.

```
http://localhost:8080/
```

L'utilsateur par défaut est `root`, le mot de passe étant défini directement dans le fichier `docker-compose.yml` (`root` par défaut)

Le port 8080 est modifiable via le fichier `.env` à la racine en changeant la variable `PHPMYADMIN_PORT`.

## Intégration continue (CI)

Un ensemble d'outils est disponible afin de mettre en place un processus d'intégration continue.

Les outils disponibles sont les suivants :

* PHP CodeSniffer
* PHPUnit
* PHPCPD
* PHPCBF
* Phing
* PHPMD
* PDepend
* PHPMetrics

Chacun de ses outils est utilisable directement via la ligne de commande.

A noter qu'un alias global permet de lancer l'ensemble du processus d'intégration continue :

```
ci
```

Concernant l'outil PHPCBF le fichier cible est nécessaire lors de l'utilisation de la ligne de commande.

Le fichier décrivant les règles de standard de code est : `docker/ci/ruleset.xml`
