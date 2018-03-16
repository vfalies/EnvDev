export UID=$(shell id -u)
export GID=$(shell id -g)

servers:
	docker-compose up --build