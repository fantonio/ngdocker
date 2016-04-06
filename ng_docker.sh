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
echo " - MENU - DE - OPÇÕES"
tput sgr0
 
tput cup 7 15
echo "1. Criar um container com imagem existente."

tput cup 8 15
echo "2. Criar um container com uma nova imagem."

tput cup 9 15
echo "3. Criar um Pool de containers"
 
tput cup 10 15
echo "4. Acessar o Pool de containers"
 
tput cup 11 15
echo "5. Listar os containers ativos"
 
tput cup 12 15
echo "6. Verificar Memória Compartilhada"

tput cup 13 15
echo "7. Análise de Desempenho do host físico"

tput cup 14 15
echo "8. Sair"
 
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
	docker run -it debian:8 /bin/bash

}

function ajustes_iniciais
{
	echo "### Ajustes Iniciais ###"; invoke-rc.d exim4 stop > /dev/null; invoke-rc.d nfs-common stop > /dev/null; invoke-rc.d portmap stop > /dev/null;
	echo "Ok!"

}

function data_hora
{
	echo "Atualizando data e hora";
	ntpdate br.pool.ntp.org > /dev/null;
	ntpdate a.ntp.br > /dev/null;
	hwclock -s;
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

function php
{
         aptitude install php5
}

case "$resposta" in
	1)
		base
	;;
	2)
		ajustes_iniciais
	;;	

	3)
		data_hora
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
		echo "Instalacao e Configuracao do E-mail (sendmail)";
		femail
	;;
	8)
		echo "Astalavista Baby!"
		exit
	;;
	*)
		echo "Você tem de entrar com um parâmetro válido"
	;;
esac
