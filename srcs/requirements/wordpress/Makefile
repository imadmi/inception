all:
	# docker build --no-cache -t  wordpress_imag .
	docker build -t wordpress_imag .

rund:
	docker run --env-file ../../../.env -d -p 9000:9000 --name container_name wordpress_imag

run:
	docker run --env-file ../../../.env -p 9000:9000 wordpress_imag

exec:
	docker exec -it container_name bash

clean:
	docker rm -f $$(docker ps -aq)

fclean: clean
	docker rmi $$(docker images -q)

re: clean fclean all rund exec


#run the container in interactive mode : docker run -it -p 9000:9000 wordpress_imag bash