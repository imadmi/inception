all:
	# docker build --no-cache -t  nginx_image .
	docker build -t nginx_image .

run:
	docker run --env-file /Users/imimouni/Desktop/inception/srcs/.env -p 443:443 --name image_name nginx_image

exec:
	docker exec -it image_name bash

clean:
	docker rm -f $$(docker ps -aq)

fclean: clean
	docker rmi $$(docker images -q)

re: clean fclean all run


#run the container in interactive mode : docker run -it nginx_image bash
# https::localhost:443