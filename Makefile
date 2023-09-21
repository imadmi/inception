all:
	docker build -t my_debian_bullseye_image .

rund:
	docker run -d --name new_container_name my_debian_bullseye_image

run:
	docker run my_debian_bullseye_image

exec:
	docker exec -it new_container_name bash

clean:
	docker rm -f $$(docker ps -aq)

fclean: clean
	docker rmi $$(docker images -q)

re: clean fclean all rund exec