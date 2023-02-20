#------------------------------------------------------------------------------#
#                                  GENERICS                                    #
#------------------------------------------------------------------------------#

# Special variables
DEFAULT_GOAL: compose
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
	docker-compose $(NAME) $(COMPOSE_FILE) up

compose:
	docker-compose $(NAME) $(COMPOSE_FILE) up --build

clean:
	docker system prune -f
	docker volume prune -f

re: clean compose
