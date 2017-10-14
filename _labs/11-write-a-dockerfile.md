---
layout: lab
number: 11
title:  "Write a Dockerfile"
---

### Goals
Write and test a simple Dockerfile.

## Make a Dockerfile

Thus far, we've only used Docker with off-the-shelf images from Docker Hub.
Sometimes, that's not good enough. Perhaps we want to build our own Docker image
with some specific software installed on it. Lucky for us, that's not too hard
to do!

Dockerfiles are files that tell the docker engine how to build a docker image.
Each Docker image is saved as a "layer", and they can build upon one another. In
other words, you can use any existing image as your starting point. We're going
to use the PHP image as our starting point because it is close to what we need.

The syntax for Dockerfiles is actually pretty simple, and [the
documentation](https://docs.docker.com/engine/reference/builder/) is easy to
follow.

Create a Dockerfile like the one below in your `my-docker-website` folder. It
should be named `Dockerfile` (with no extension).

**Dockerfile**

```docker
FROM php:7.1-apache

RUN docker-php-ext-install -j$(nproc) pdo_mysql
```

That's a simple Dockerfile, but it's all we need for now. The
`docker-php-ext-install` command is a script that comes with the PHP Docker
image, and is documented in that image's documentation.

## Test the Dockerfile

To test the Dockerfile, we need to build it. Building a Dockerfile is the
process that turns a Dockerfile into a Docker image.

{:.terminal}
```
$ docker build -t my-php-image:latest ./
```

 - The `-t my-php-image:latest` tells Docker to tag the image with this name. We
   could use any name we want here - it's our own image.
 - The final argument, `./`, is the directory containing the Dockerfile we want
   to build.

Congratulations, you've built your first Docker image! But how do we run it? If
you run the `docker images` command, you'll see it listed along with the other
Docker images you have on your system. We can run your image just like any other
image.

{:.terminal}
```
$ docker run --rm -it my-php-image:latest /bin/bash
```

This is a really useful `docker run` command for testing images, or just looking
around inside them.

 - `--rm` tells Docker to remove this container as soon as it exits. This is
   convenient so we don't have to clean it up later.
 - `-it` tells Docker we want an interactive TTY.
 - The final arugument, `/bin/bash`, is the command we want to run. Running
   `/bin/bash` gives us a bash prompt inside the container.

You can look around inside the container all you want. When you're satisfied,
exit the container. Let's get back to our website project.
