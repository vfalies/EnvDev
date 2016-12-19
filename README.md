# Pré-Requis

Les pré-requis sur la machine hôte sont les suivants :

- [docker](https://www.docker.com/products/overview)
- [docker-compose](https://docs.docker.com/compose/install/)

## Windows

Windows 7 ou plus récent avec le support de la virtualisation.
Télécharger [Docker Toolbox](https://www.docker.com/toolbox) pour permettre l'utilisation de docker.

Attention, les fichiers devant être partagés avec la machine virtuelle doivent impérativement être déposé dans le Home utilisateur :

- `C:/Users/[NomUtilisateur]/`

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
  - nodejs
  - npm

Pour installer ces alias, utiliser la commande suivante :

```
source .bash_aliases
```
# Utilisation

Sous Windows, `localhost` devra être remplacé par l'adresse IP de la machine virtuelle Docker Toolbox.

## Accès web

L'utilisation du serveur web se fait via le port 81. Un phpinfo() est disponible à l'adresse :

```
http://localhost:81/phpinfo.php
```

## Maildev

L'outil Maildev permettant de développer de manière les mails avec un serveur de mails local est disponible à l'adresse :

```
http://localhost:1080
```

## PhpMyAdmin

PhpMyAdmin est disponible via le port 8080.

```
http://localhost:8080/
```

L'utilsateur par défaut est `root`, le mot de passe étant défini directement dans le fichier `docker-compose.yml` (`root` par défaut)
