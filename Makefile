all:
	docker build -t deltachat/linux-stretch-node-11 linux-stretch-node-11
	docker push deltachat/linux-stretch-node-11
