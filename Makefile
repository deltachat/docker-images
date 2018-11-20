build:
	docker build -t deltachat/debian-stretch-node-11 debian-stretch-node-11

push:
	docker push deltachat/debian-stretch-node-11
