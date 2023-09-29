# all:
# 	docker build -t my_debian_bullseye_image .

# rund:
# 	docker run -d --name new_container_name my_debian_bullseye_image

# run:
# 	docker run my_debian_bullseye_image

# exec:
# 	docker exec -it new_container_name bash

# clean:
# 	docker rm -f $$(docker ps -aq)

# fclean: clean
# 	docker rmi $$(docker images -q)

# re: clean fclean all rund exec

all:
	docker compose -f srcs/docker-compose.yaml up

up: 
	docker compose -f srcs/docker-compose.yaml up -d

down: 
	docker compose -f srcs/docker-compose.yaml down

clean: down
	docker volume rm $$(docker volume ls -q)
	docker rmi $$(docker images -a -q)
	rm -rf /Users/imimouni/data/wp/* -y
	rm -rf /Users/imimouni/data/db/* -y

prune:
	docker system prune --all --volumes --force

re: down all

nginx:
	docker exec -it nginx bash

mariadb:
	docker exec -it mariadb bash

wordpress:
	docker exec -it wordpress bash