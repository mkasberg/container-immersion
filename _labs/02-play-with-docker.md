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

```
$ docker run -it ubuntu:latest /bin/bash
root@c267f778d237:/#
```

We are at a bash prompt! The prompt is `#` rather than `$`. This is a great way
to know that you’re at a prompt inside the Docker container rather than on your
host machine. (It also indicates that you’re the *root* user inside the
container \- more on that later).

```
root@c267f778d237:/# echo "Hello from a Bash prompt in an Ubuntu container!"
Hello from a Bash prompt in an Ubuntu container!
root@c267f778d237:/# pwd
/
root@c267f778d237:/# ls
bin boot dev etc home lib lib64 media mnt opt proc root run sbin srv sys tmp usr var
```

## Container Persistence

We can run commands just like any other Linux prompt. We can also edit files.

```
root@c267f778d237:/# echo "Look, I can write to a file!" > foo.txt
root@c267f778d237:/# ls
bin boot dev etc foo.txt home lib lib64 media mnt opt proc root run sbin srv sys tmp usr var
root@c267f778d237:/# cat foo.txt
Look, I can write to a file!
root@c267f778d237:/# exit
exit
```

We were able to write to the filesystem inside the container. Cool. Let's go
back and look at that again.

```
$ docker run -it ubuntu:latest /bin/bash
root@cd9f034e05e6:/# cat foo.txt
cat: foo.txt: No such file or directory
root@cd9f034e05e6:/# ls
bin boot dev etc home lib lib64 media mnt opt proc root run sbin srv sys tmp usr var
root@cd9f034e05e6:/# exit
exit
```

Weird. Our file isn't there anymore. What happened to it? Well, we are in a
different container than we were the first time. When we ran the same `docker
run` command, it started a different container. Although it was created from the
same _image_, the filesystem is completely fresh - nothing is shared with the
first container we ran.

Can we get our file back? As a matter of fact, yes. We can get a list of all the
containers on our machine (including the stopped ones) with `docker ps -a`.

```
$ docker ps -a
CONTAINER ID    IMAGE           COMMAND     CREATED         STATUS                  	PORTS   NAMES
cd9f034e05e6    ubuntu:latest   "/bin/bash" 5 minutes ago   Exited (0) 4 minutes ago            eager_lamarr
ebde4b281dec    ubuntu:latest   "/bin/bash" 10 minutes ago  Exited (0) 5 minutes ago            competent_saha
```

We can see our stopped container there. Let's get back to bash in the container
where we made our file. (**Note:** Your ID will be different than mine!)

```
$ docker start -i ebde4b281dec
root@ebde4b281dec:/# cat foo.txt
Look, I can write to a file!
root@ebde4b281dec:/# ls
bin boot dev etc foo.txt home lib lib64 media mnt opt proc root run sbin srv sys tmp usr var
root@ebde4b281dec:/# exit
exit
```

With `docker start`, we can re-start a stopped container. This can be useful for
things like debugging, but is not a normal part of the Docker workflow.

As you might have realized, we have several "dead" stopped containers hanging
around on our filesystem. We don't need those containers anymore, so let's clean
them up. In the commands below, I'm resuing the container IDs from `docker ps
-a` above.

```
$ docker rm cd9f034e05e6
cd9f034e05e6
$ docker rm ebde4b281dec
ebde4b281dec
```

Feel free to play around with the things we've learned so far to get comfortable
with them. When you're ready, move on to the next lab.

