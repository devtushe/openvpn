ovpn_bild:
	docker build -t den4ik7707/den_openvpn:1.3 .
ovpn_run:
	docker run -it -p 1717:1194 -v /usr/openvpn:/usr/openvpn --name=openvpn --cap-add=NET_ADMIN --device=/dev/net/tun den4ik7707/den_openvpn:1.3 sh
ovpn_start:
	docker start -i openvpn
ovpn_connect:
	docker exec -ti openvpn sh
