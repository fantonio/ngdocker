#!/bin/bash

##########################################################################################
# Descrição: Script para inicialização de um pool de Containers com a novagenesis	 #
# Nome: ng_docker.sh							     		 #
# Versão 1.0  								      		 #
# Data: 15/04/2016						              		 #
# Autor: Fábio Antonio Ferreira                                               		 #
# E-mail: fantonios@gmail.com                                                 		 #
#                                                                             		 #
##########################################################################################

preto="\033[0;30m"
vermelho="\033[0;31m"
verde="\033[0;32m"
 
# clear the screen
tput clear
 
# Move cursor to screen location X,Y (top left is 0,0)
tput cup 3 15
 
# Set a foreground colour using ANSI escape
tput setaf 3
echo "NovaGenesis - Docker - Versão 1.0"
tput sgr0
 
tput cup 5 17
# Set reverse video mode
tput rev
echo " Menu Options "
tput sgr0
 
tput cup 7 15
echo "1. Create a container with an existing image."

tput cup 8 15
echo "2. Create a container with an new image."

tput cup 9 15
echo "3. Create a set of container"
 
tput cup 10 15
echo "4. Get a set of containers"
 
tput cup 11 15
echo "5. List a set of containers"
 
tput cup 12 15
echo "6. Check shared memory"

tput cup 13 15
echo "7. Remove all containers"

tput cup 14 15
echo "8. Exit"
 
# Set bold mode
tput bold
tput cup 15 15
echo "Enter your choice [1-8] "
read resposta
tput clear
tput sgr0
tput rc

function newc
{
	echo " Create a new container! ";
	docker run -it debian:8 /bin/bash >> /dev/null

}

function newci
{
	echo " Create a new container! ";
	docker run -it debian:8 /bin/bash >> /dev/null

}

function poolcontainer
{
	echo "Enter the number of Containers:"
	read numcont
	echo "Enter with an Container Image:"
	read img
	passo=1
	for passo in $(seq $numcont)
	do
		echo -e "Container" $passo " \033[0;32m [Ok]  \033[0m"
		docker run -itd $img >> /dev/null
	done

	echo "Ok!"

}

function getsetcontainer
{
	echo "Under construction";
}

function containerlist
{
	docker ps
}

 function checkshm
{
	ipcs -m
}

function removeall
{
	docker rm -f $(docker ps -a -q)
	echo -e "Containers successfully removed \033[0;31m [Ok]  \033[0m"
}

case "$resposta" in
	1)
		echo "Create existing image of container"
		newc
	;;
	2)
		echo "Create new image of container"
		newci
	;;	

	3)
		echo "Create pool of Containers"		
		poolcontainer
	;;
	4)
		echo "Conect all Containers"
		getsetcontainer
	;;
	5)
		echo "List of Containers"
		containerlist
	;;
	6)
		echo "Check Shared Memory"
		checkshm
	;;
	7)
		echo "Remove all containers";
		removeall
	;;
	8)
		echo "Astalavista Baby!"
		exit
	;;
	*)
		echo "You must enter a valid parameter"
	;;
esac
