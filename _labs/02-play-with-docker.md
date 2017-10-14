---
layout: lab
number: 2
title:  "Play With Docker"
---

### Goals
Learn to run basic commands with Docker and get to an interactive shell.

## Hello from Ubuntu

Let's run some simple commands in Docker. For this, we're going to use the
[Ubuntu](https://hub.docker.com/_/ubuntu/) Docker image, which will allow us to
run most Linux commands.

{:.terminal}
```
$ docker run ubuntu:latest echo "Hello from Ubuntu."
Unable to find image 'ubuntu:latest' locally
latest: Pulling from library/ubuntu

...

2508cbcde94b: Pull complete
Digest: sha256:71cd81252a3563a03ad8daee81047b62ab5d892ebbfbf71cf53415f29c130950
Status: Downloaded newer image for ubuntu:latest
Hello from Ubuntu.
```

Let's break that down:

 - `docker run` is the Docker command to run a container.
 - `ubuntu` is the name of the Docker image we're running in our container. This
   image comes from Docker Hub.
 - `latest` is the “tag”, or version of the image that we want to use.
 - `echo "Hello from Ubuntu."` is the command that we're running inside the
   container.

Docker pulls the image for Ubuntu automatically if it isn't already cached. Then
it runs our echo command.

## Bash in Ubuntu

Instead of running `echo`, we can ask Docker to run `/bin/bash` inside the
Ubuntu container. This will get us to an interactive shell.

{:.terminal}
```
$ docker run -it ubuntu:latest /bin/bash
root@c267f778d237:/#
```

We are at a bash prompt! The prompt is `#` rather than `$`. This is a great way
to know that you’re at a prompt inside the Docker container rather than on your
host machine. (It also indicates that you’re the *root* user inside the
container \- more on that later). Let's run some simple commands and have a look
around.

{:.terminal}
```
root@c267f778d237:/# echo "Hello from a Bash prompt in an Ubuntu container!"
Hello from a Bash prompt in an Ubuntu container!
root@c267f778d237:/# pwd
/
root@c267f778d237:/# ls
bin boot dev etc home lib lib64 media mnt opt proc root run sbin srv sys tmp usr var
```

Feel free to experiment some more inside the container, when you're done, run
`exit` to exit Bash and stop the container. Then move on to the next lab.
