export USER_ID=$(shell id -u)
export GROUP_ID=$(shell id -g)

servers:
	docker-compose up --build --remove-orphans