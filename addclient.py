import os
import sys

EMPTY_INPUT = """
Скрипт запущен неправильно!
Правильно:
python addsert.py nameclient user последний_октет_ip_адреса
где user это имя твоего нарутового пользователя."""

if len(sys.argv) != 4 or all(not arg for arg in sys.argv[1:]):
    print(EMPTY_INPUT)
    sys.exit(1)

nameclient = sys.argv[1]
user = sys.argv[2]
ip_last_octet = sys.argv[3]
#print(f'nameclient = {nameclient} \t user = {user} \t ip_last_octet = {ip_last_octet}')

easyrsa_path = "/usr/share/easy-rsa/3"
openvpn_path = "/etc/openvpn"
