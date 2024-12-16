all:
	@sudo mkdir -p /home/alboumed/data/mysql_volume /home/alboumed/data/wp_volume /home/alboumed/data/phpmyadmin_volume
	@sudo docker compose -f ./docker-compose.yml up --build -d
	
restart:
	@sudo docker compose -f ./docker-compose.yml stop
	@sudo docker compose -f ./docker-compose.yml start

start:
	@sudo docker compose -f ./docker-compose.yml start

stop:
	@sudo docker compose -f ./docker-compose.yml stop

down:
	@sudo docker compose -f ./docker-compose.yml down

clean:
	@sudo docker compose -f ./docker-compose.yml stop
	@sudo docker compose -f ./docker-compose.yml rm
	@sudo docker volume rm mysql_volume wp_volume phpmyadmin_volume
	@sudo sudo rm -rf /home/alboumed/data
	@sudo docker rmi -f $$(sudo docker images -aq)

re: clean all

.PHONY: all clean fclean re