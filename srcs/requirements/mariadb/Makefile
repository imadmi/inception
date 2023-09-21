all:
	# docker build --no-cache -t  mariadb_imag .
	docker build -t mariadb_imag .

rund:
	docker run --env-file /Users/imimouni/Desktop/inception/srcs/.env -d -p 3306:3306 --name new_container_name mariadb_imag

run:
	docker run --env-file /Users/imimouni/Desktop/inception/srcs/.env -p 3306:3306 mariadb_imag

exec:
	docker exec -it new_container_name bash

clean:
	docker rm -f $$(docker ps -aq)

fclean: clean
	docker rmi $$(docker images -q)

re: clean fclean all rund exec


#run the container in interactive mode : docker run -it mariadb_imag bash