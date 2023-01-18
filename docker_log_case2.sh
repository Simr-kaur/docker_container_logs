#!/bin/bash
clear
echo "---------------------------"
read -p  "Enter the number of container you want to run:" a
echo "----------------------------"
i=0
while [[ $i -lt $a ]]
do
        i=$(($i+1))
        read -p "Enter the name of image you want to want to pull:-" img
        docker pull $img
done
echo "----------------------"
echo "*******IMAGES PULL SUCCESSFULLY*******"
echo "----------------------"

read -p "Enter the number of container you want to run:->" b
echo "----------------------"

x=0
while [[ $x -lt $b ]]
do
        x=$(($x+1))
	echo "-----------------------------------------------------------------------"
        read -p "Enter the name of pulled images you want to run as container:->" img
	echo "-----------------------------------------------------------------------"
	read -p "Enter the name of container:" con_name
	echo "-----------------------------------------"
	read -p "Enter the port number" port
	echo "-----------------------------------------"
	docker run -dt --name $con_name -p $port $img
done
echo "---------------------------------"
echo "*******CONTAINER RUNNING*********"
echo "---------------------------------"

read -p "Enter the number of files you want to pubish as a log file:->" c
echo "-------------------------------------------------------------------"

y=0
while [[ $y -lt $c ]]
do
        y=$(($y+1))
	echo "--------------------------------------------------------------------------"
	read -p "Enter the name of container, you want to publish in text file:" img_con
	echo "--------------------------------------------------------------------------"
	docker logs $img_con >> $img_con.container.txt
done
echo "----------------------------------------"
echo "******LOGS SENT SUCCESSFULLY*******"
echo "----------------------------------------"
echo "----------------------------------------"
echo "***************DONE*********************"
echo "-----------------------------------------"
