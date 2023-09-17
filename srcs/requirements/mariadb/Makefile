all:
	# docker build --no-cache -t  mariadb_image .
	docker build -t mariadb_image .

run:
	docker run --env-file ../../../.env -p 8080:443 --name image_name mariadb_image

exec:
	docker exec -it image_name bash

clean:
	docker rm -f $$(docker ps -aq)

fclean: clean
	docker rmi $$(docker images -q)

re: clean fclean all run


#run the container in interactive mode : docker run -it mariadb_image bash