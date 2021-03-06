start:
	docker-compose up -d

bash: start
	docker-compose exec --user www-data:www-data php ash || true

install: start
	docker-compose exec --user www-data:www-data php composer install

build:
	docker-compose build

down:
	docker-compose down
