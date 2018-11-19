# docker-images

> A collection of docker images needed for [`https://ci.delta.chat`](https://ci.delta.chat/blue).

## Images

### `linux-stretch-node-11`

Linux image for building `deltachat-desktop`.

## Build

Currently you build all images by doing `make build`.

In order to push images to `hub.docker.com` you first need to be logged in:

```sh
$ docker login
```

Before doing `make push`.

This only needs to be done once per machine. Credentials are stored in `~/.docker/config.json`.

## License

CC-BY-SA
