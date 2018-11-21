build:
	docker build -t deltachat/debian-stretch-node-11 debian-stretch-node-11
	docker build -t deltachat/debian-stretch-android debian-stretch-android

push:
	docker push deltachat/debian-stretch-node-11
	docker push deltachat/debian-stretch-android
