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

run:
	sudo docker-compose $(NAME) $(COMPOSE_FILE) up

compose:
	sudo docker-compose $(NAME) $(COMPOSE_FILE) up --build

clean:
	sudo docker system prune -f
	sudo docker volume prune -f

re: clean compose
