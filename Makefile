#------------------------------------------------------------------------------#
#                                  GENERICS                                    #
#------------------------------------------------------------------------------#

# Special variables
DEFAULT_GOAL: re
.PHONY: compose clean re


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

run:
	sudo docker-compose $(NAME) $(COMPOSE_FILE) up

compose:
	sudo docker-compose $(NAME) $(COMPOSE_FILE) up --build

clean:
	sudo docker system prune -f
	sudo docker volume prune -f

re: clean compose
