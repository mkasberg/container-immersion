---
layout: lab
number: 3
title:  "Container Persistence"
---

### Goals
Learn what happens when a container is stopped.

## Container Persistence

### Write a Text File

Inside a container, we can run commands just like any other Linux prompt. We can
also edit files.  Let's get back to a command prompt inside an Ubuntu container
and create a text file.

```
$ docker run -it ubuntu:latest /bin/bash
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

Huh? What happened to our file? It isn't there anymore. This is happening
because we are in a different container than we were the first time. When we ran
the same `docker run` command, it started a _new_ container from the same Ubuntu
image. The filesystem inside the container is completely fresh - nothing is
shared with the first container we ran.

### Restart a Stopped Container

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

