import os
import sys
import shutil
import subprocess

# Проверка корректности ввода
EMPTY_INPUT = """
Скрипт запущен неправильно!
Правильно:
python addsert.py nameclient user последний_октет_ip_адреса
где user это имя твоего нарутового пользователя."""

if len(sys.argv) != 4 or all(not arg for arg in sys.argv[1:]):
    print(EMPTY_INPUT)
    sys.exit(1)

# Определение входных аргументов
nameclient = sys.argv[1]
user = sys.argv[2]
ip_last_octet = sys.argv[3]
#print(f'nameclient = {nameclient} \t user = {user} \t ip_last_octet = {ip_last_octet}')

# Пути к файлам и директориям
easyrsa_path = "/usr/share/easy-rsa/3"
openvpn_path = "/etc/openvpn"
shablon_ovpn = "/etc/openvpn/ovpn/shablon.ovpn"

# Выполнение скрипта vars
subprocess.run(["sh", "{}/vars".format(easyrsa_path)], check=True)

# Генерация запроса сертификата и подпись
subprocess.run(["sh", "{}/easyrsa".format(easyrsa_path), "gen-req", sys.argv[1], "nopass"], check=True)
#subprocess.run(["sh", "{}/easyrsa".format(easyrsa_path), "sign-req", "client", sys.argv[1]], check=True)
