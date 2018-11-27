# docker-images

> A collection of docker images needed for [`https://ci.delta.chat`](https://ci.delta.chat/blue).

## Images

### `debian-stretch-node-11`

Linux image based on Debian Stretch and node v11. It contains support for running `chromium` and `xvfb` because running a headless `electron` requires using a virtual frame buffer. Builds and tests the following projects:

* `deltachat-desktop`
* `deltachat-node`

### `debian-stretch-android`

Linux image for building `deltachat-android-ii` based on Debian Stretch.

Build `deltachat-android-ii`:

```sh
$ cd deltachat-android-ii
$ docker run -it --rm -v $(pwd):/android -w /android deltachat/debian-stretch-android ./ci-build.sh
+ git clean -fxd
+ git submodule update --recursive --init
+ rm build/ -rf
+ ndk-build
[armeabi] Compile++ thumb: native-utils <= org_thoughtcrime_securesms_util_FileUtils.cpp
[armeabi] Compile thumb  : native-utils <= compress.c
[armeabi] Compile thumb  : native-utils <= create.c
...
```

**Note** This is a work in progress and above command currently only works in the `jenkins` branch of `deltachat-android-ii`.

## Build

Currently, each image has its own `Makefile`. To build e.g. `debian-stretch-android` you do:

```sh
$ cd debian-stretch-android && make
```

To push it to `hub.docker.com` do:

```sh
$ cd debian-stretch-android && make push
```

In order to push images to `hub.docker.com` you first need to be logged in:

```sh
$ docker login
```

This only needs to be done once per machine. Credentials are stored in `~/.docker/config.json`.

## License

CC-BY-SA
