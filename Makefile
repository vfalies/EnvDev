export USER_ID=$(shell id -u)
export GROUP_ID=$(shell id -g)

help: ## Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

profile: ## Create new profile
	@echo '******** Create new profile ********'
	@sh -c scripts/profile.sh

run: ## Run a saved profile
run: stop
	@echo '******** Running a saved profile **********'
	@sh -c scripts/run.sh

servers: ## Start default containers
	@echo '******** Starting all containers... ********'
	@sh -c scripts/servers.sh

start: ## Start default containers
start: servers

stop: ## Stop all containers
	@echo '******** Stopping all containers... ********'
	@docker-compose down --remove-orphans

restart: ## Restart containers
restart: stop run

certificate: ## Generate a SSL certificate
	@echo '******** Generate a SSL certificate ********'
	@docker run -ti --rm -v $(shell pwd)/conf/ssl:/app/ssl vfac/certificates /app/certificate.sh

renewal: ## Renewal a knowed SSL certificate
	@echo '******** Renew a SSL certificate ********'
	@docker run -ti --rm -v $(shell pwd)/conf/ssl:/app/ssl vfac/certificates /app/regenerate_certificate.sh

install: ## Install EnvDev container environment
	@echo '******** Install EnvDev container environment ********'
	include .env
	@docker-compose build --force-rm --no-cache && docker run --rm -v $(shell pwd):/var/www/html -u "$(USER_ID):$(GROUP_ID)" vfac/envdevphpbase:$(PHP_VERSION) sh -c "cd /var/www/html/home/envdev; composer update --lock"

homepage: ## Launch EnvDev homepage in default browser
	@echo '******** Launch Homepage in browser ********'
	@x-www-browser envdev.localhost

terminal: ## Create a terminal on PHP container
	@echo '******** Launch terminal ********'
	@docker exec -ti php /bin/bash

terminalroot: ## Create a terminal on PHP container as root
	@echo '******** Launch terminal as root ********'
	@docker exec -ti -u 0 php /bin/bash