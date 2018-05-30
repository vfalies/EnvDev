export USER_ID=$(shell id -u)
export GROUP_ID=$(shell id -g)

include .env

help: ## Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

servers: ## Start all containers
	@echo '******** Starting all containers... ********'
	@docker-compose up -d --build --remove-orphans

start: ## Start all containers
start: servers

stop: ## Stop all containers
	@echo '******** Stopping all containers... ********'
	@docker-compose down

restart: ## Restart all containers
restart: stop servers

certificate: ## Generate a SSL certificate
	@echo '******** Generate a SSL certificate ********'
	@docker run -ti --rm -v $(shell pwd)/conf/ssl:/app/ssl vfac/certificates /app/certificate.sh

renewal: ## Renewal a knowed SSL certificate
	@echo '******** Renew a SSL certificate ********'
	@docker run -ti --rm -v $(shell pwd)/conf/ssl:/app/ssl vfac/certificates /app/regenerate_certificate.sh

install: ## Install EnvDev container environment
	@echo '******** Install EnvDev container environment ********'
	@docker-compose build --force-rm --no-cache && docker run --rm -v $(shell pwd):/var/www/html -u "$(USER_ID):$(GROUP_ID)" vfac/envdevphpbase:$(PHP_VERSION) sh -c "cd /var/www/html/home/envdev; composer update --lock"

homepage: ## Launch EnvDev homepage in default browser
	@echo '******** Launch Homepage in browser ********'
	@x-www-browser envdev.localhost

terminal: ## Create a terminal to php container
	@echo '******** Launch terminal ********'
	@docker exec -ti php /bin/bash

terminalroot: ## Create a terminal to php container as root
	@echo '******** Launch terminal as root ********'
	@docker exec -ti -u 0 php /bin/bash
