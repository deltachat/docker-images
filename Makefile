build:
	docker build -t deltachat/linux-stretch-node-11:1.1 linux-stretch-node-11

push:
	docker push deltachat/linux-stretch-node-11:1.1
