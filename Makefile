run:
	docker-compose up --build

docker.build:
	docker build -t azeroth-mods/app_service:latest .

docker.db.setup:
	docker-compose run app rake db:setup

docker.logs:
	docker-compose logs --follow

docker.tag:
	docker tag azerothmods/app_service:latest hub.ergot.space/azerothmods/app_service:latest

docker.push:
	docker image push hub.ergot.space/azerothmods/app_service:latest