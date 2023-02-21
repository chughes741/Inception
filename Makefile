#------------------------------------------------------------------------------#
#                                  GENERICS                                    #
#------------------------------------------------------------------------------#

# Special variables
DEFAULT_GOAL: run
.PHONY: clean_eval run build clean re


#------------------------------------------------------------------------------#
#                                VARIABLES                                     #
#------------------------------------------------------------------------------#

NAME			= -p inception
COMPOSE_FILE	= -f ./srcs/docker-compose.yml


#------------------------------------------------------------------------------#
#                                 TARGETS                                      #
#------------------------------------------------------------------------------#


clean_eval:
	docker stop $$(docker ps -qa); \
	docker rm $$(docker ps -qa); \
	docker rmi -f $$(docker images -qa); \
	docker volume rm $$(docker volume ls -q); \
	docker network rm $$(docker network ls -q) 2>/dev/null

run: build
	sudo docker compose up -d $(NAME) $(COMPOSE_FILE)

build:
	sudo docker-compose $(COMPOSE_FILE) build

clean:
	sudo docker system prune -f
	sudo docker volume prune -f

re: clean compose
