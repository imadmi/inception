all:
	docker build -t ngnx .

run:
	docker run --env-file ../../../.env -d -p 8080:443 --name name_ngnx ngnx

exec:
	docker exec -it name_ngnx bash

clean:
	docker rm -f $$(docker ps -aq)

fclean: clean
	docker rmi $$(docker images -q)

re: fclean clean all run
