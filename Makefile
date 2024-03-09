ovpn_bild:
	docker build -t den4ik7707/den_openvpn:1.2 .
ovpn_run:
	docker run -it -p 17.17.17.1:1718:1194 -v /etc/openvpn/docker:/etc/openvpn --name=openvpn --cap-add=NET_ADMIN --device=/dev/net/tun den4ik7707/den_openvpn:1.1 sh
ovpn_start:
	docker start -i openvpn
ovpn_connect:
	docker exec -ti openvpn sh
