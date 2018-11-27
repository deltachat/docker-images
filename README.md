# docker-images

> A collection of docker images needed for [`https://ci.delta.chat`](https://ci.delta.chat/blue).

## Images

### `debian-stretch-node-11`

Linux image based on Debian Stretch and node v11. It contains support for running `chromium` and `xvfb` because running a headless `electron` requires using a virtual frame buffer. Builds and tests the following projects:

* `deltachat-desktop`
* `deltachat-node`

### `debian-stretch-android`

Linux image for building `deltachat-android-ii` based on Debian Stretch.

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
