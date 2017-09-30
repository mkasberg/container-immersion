---
layout: lab
number: 1
title:  "Setup"
---

### Goals
To setup Docker on your machine.

## Install Docker

Install Docker CE for
[Windows](https://docs.docker.com/docker-for-windows/install/),
[Mac](https://docs.docker.com/docker-for-mac/install/), or
[Linux](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/) by
following the official installation instructions for your platform.

## Test Your Installation

To make sure that the installation worked, run the following Docker command. If
it produces the welcome message, you're ready to move on to the next lab.

```
$ docker run hello-world

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://cloud.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/engine/userguide/
```

