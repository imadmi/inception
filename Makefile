
all:
	docker compose -f srcs/docker-compose.yaml up

up: 
	docker compose -f srcs/docker-compose.yaml up -d

down: 
	docker compose -f srcs/docker-compose.yaml down

clean: down
	docker volume rm $$(docker volume ls -q)
	docker rmi $$(docker images -a -q)
	sudo -p" " rm -rf /home/imimouni/data/wp/*
	rm -rf -p" " /home/imimouni/data/db/*

prune:
	docker system prune --all --volumes --force

re: down all

nginx:
	docker exec -it nginx bash

mariadb:
	docker exec -it mariadb bash

wordpress:
	docker exec -it wordpress bash



# scp /path/to/local/.env imimouni@10.13.100.166:/path/to/remote/destination
