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

{:.terminal}
```
$ docker run -it --name lab_03_container_01 ubuntu:latest /bin/bash
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

{:.terminal}
```
$ docker run -it --name lab_03_container_02 ubuntu:latest /bin/bash
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

{:.terminal}
```
$ docker ps -a
CONTAINER ID  IMAGE         COMMAND     CREATED        STATUS                   PORTS  NAMES
cd9f034e05e6  ubuntu:latest "/bin/bash" 5 minutes ago  Exited (0) 4 minutes ago        lab_03_container_02
ebde4b281dec  ubuntu:latest "/bin/bash" 10 minutes ago Exited (0) 5 minutes ago        lab_03_container_01
```

We can see our stopped container there. Let's get back to bash in the container
where we made our file. You can do this with the container's name or ID. We
named our containers earlier in this lab for convenience and easy
identification, so we'll use that now to restart the stopped container.

{:.terminal}
```
$ docker start -i lab_03_container_01
root@ebde4b281dec:/# cat foo.txt
Look, I can write to a file!
root@ebde4b281dec:/# ls
bin boot dev etc foo.txt home lib lib64 media mnt opt proc root run sbin srv sys tmp usr var
root@ebde4b281dec:/# exit
exit
```

Because we restarted our stopped container instead of running a new container,
our changes to the filesystem were present. We can see the contents of the
`foo.txt` file that we made. With `docker start`, we can re-start a stopped
container. This can be useful for things like debugging, but is not a normal
part of the Docker workflow, so don't get used to using it too often.

Feel free to play around with the things we've learned so far to get comfortable
with them. When you're ready, move on to the next lab.
