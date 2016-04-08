#!/bin/bash

##########################################################################################
# Descrição: Script para inicialização de um pool de Containers com a novagenesis	 #
# Nome: ng_docker.sh							     		 #
# Versão 1.0  								      		 #
# Data: 05/04/2016						              		 #
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

function base
{
	echo " Criando um container! ";
	docker run -it debian:8 /bin/bash >> /dev/null

}

function poolcontainer
{
	echo "Entre com o número de Containers:"
	read numcont	
	passo=1
	for passo in $(seq $numcont)
	do
		echo -e "Container" $passo " \033[0;32m [Ok]  \033[0m"
		docker run -itd debian >> /dev/null
	done

	echo "Ok!"

}

function data_hora
{
	echo "Atualizando data e hora";
	echo "Seu Time Zone:"
	cat /etc/timezone
}

function femail
{
	echo "Instalando servidor de e-mail";
	aptitude install sendmail sendmail-base sendmail-bin sendmail-cf sensible-mda
}

 function webserver
{
         echo "##########################################################";
         echo "# Instalação e configuração do servidor Web              #";
         echo "##########################################################";
         aptitude install apache2 libapache2-mod-php5
}

function mysqlserver
{
        aptitude install mysql-server mysql-client mysql-common
}

function removeall
{
	docker rm -f $(docker ps -a -q)
	echo -e "Containers successfully removed \033[0;31m [Ok]  \033[0m"
}

case "$resposta" in
	1)
		base
	;;
	2)
		ajustes_iniciais
	;;	

	3)
		poolcontainer
	;;
	4)
		echo "Instalando o APACHE2"
		webserver
	;;
	5)
		echo "Instalando MYSQL"
		mysqlserver
	;;
	6)
		echo "Instalando PHP5"
		php
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
		echo "Você tem de entrar com um parâmetro válido"
	;;
esac
