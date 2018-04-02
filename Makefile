export USER_ID=$(shell id -u)
export GROUP_ID=$(shell id -g)

include .env

servers:
	docker-compose up --build --remove-orphans

install:
	docker-compose build --force-rm --no-cache && docker run --rm -v $(shell pwd):/var/www/html -u "$(USER_ID):$(GROUP_ID)" vfac/envdevphpbase:$(PHP_VERSION) sh -c "cd /var/www/html/home/envdev; composer update --lock"

home:
	x-www-browser envdev.localhost