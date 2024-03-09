#!/bin/bash

if [[ -z "$1" && -z "$2" && -z "$3" ]]
then
	echo "Скрипт запущен неправильно!"
	echo "Правильно:"
	echo "addsert.sh nameclient user последний_октет_ip_адреса"
	echo "где user это имя твоего нарутового пользователя."
else
	sh /usr/share/easy-rsa/3/vars
        sh /usr/share/easy-rsa/3/easyrsa gen-req $1 nopass
        sh /usr/share/easy-rsa/3/easyrsa sign-req client $1
	echo "Сделано:"
	echo "Сгенерированы сертификат и ключ для $1"
	echo "Серт лежит в /etc/openvpn/easy-rsa/pki/issued/$1.crt"
	echo "Ключ лежит в /etc/openvpn/easy-rsa/pki/private/$1.key"
	
	cp /etc/openvpn/ovpn/shablon.ovpn /etc/openvpn/ovpn/$1.ovpn
	sed -i '48r /etc/openvpn/easy-rsa/pki/issued/'$1'.crt' /etc/openvpn/ovpn/$1.ovpn
	sed -i '135r /etc/openvpn/easy-rsa/pki/private/'$1'.key' /etc/openvpn/ovpn/$1.ovpn
	echo "Создан конфиг клиента $1: /etc/openvpn/ovpn/$1.ovpn"
	
	cp /etc/openvpn/ovpn/$1.ovpn /home/$2/ovpn/
	chown root:$2 /home/$2/ovpn/$1.ovpn
	chmod 660 /home/$2/ovpn/$1.ovpn
	echo "Конфиг помещен в твой домашний каталог: /home/$2/ovpn/$1.ovpn"
	
	IP=$3
	let "IP=IP+1"
	echo "ifconfig-push 17.17.17.$3 17.17.17.$IP" > /etc/openvpn/ccd/$1
	chown root:openvpn /etc/openvpn/ccd/*
	chmod 660 /etc/openvpn/ccd/*

	#echo -e "$1\tA\t17.17.17.$3" >> /var/named/chroot/var/named/gvpn.io

	echo "Клиенту $1 выдан IP: 17.17.17.$3"
	#echo "Для клиента $1 создана запись в DNS, измени серийный номер зоны по пути /var/named/chroot/var/named/gvpn.io и сделай rndc reload"
fi
