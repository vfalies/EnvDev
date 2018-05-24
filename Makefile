export USER_ID=$(shell id -u)
export GROUP_ID=$(shell id -g)

include .env

servers:
	@docker-compose up -d --build --remove-orphans

stop:
	@docker-compose down

restart:
	@$(MAKE) -s stop && $(MAKE) -s servers

certificate_creation:
	@docker run -ti --rm -v $(shell pwd)/conf/ssl:/app/ssl vfac/certificates /app/certificate.sh

certificate_regeneration:
	@docker run -ti --rm -v $(shell pwd)/conf/ssl:/app/ssl vfac/certificates /app/regenerate_certificate.sh

install:
	@docker-compose build --force-rm --no-cache && docker run --rm -v $(shell pwd):/var/www/html -u "$(USER_ID):$(GROUP_ID)" vfac/envdevphpbase:$(PHP_VERSION) sh -c "cd /var/www/html/home/envdev; composer update --lock"

homepage:
	@x-www-browser envdev.localhost