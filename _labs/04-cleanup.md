---
layout: lab
number: 4
title:  "Cleanup"
---

### Goals
Learn to view docker containers and clean them up.

## View Your Containers

Docker comes with a command to view the containers that are currently running on
your system. Let's try it now.

```
$ docker ps
CONTAINER ID    IMAGE       COMMAND     CREATED		STATUS      PORTS       NAMES
```

As you might have guessed, nothing’s running. Let's use the `-a` flag to see
*all* containers, including stopped ones.

```
$ docker ps -a
CONTAINER ID    IMAGE           COMMAND         CREATED             STATUS                         PORTS    NAMES
c267f778d237    ubuntu:latest   "/bin/bash"     53 minutes ago      Exited (0) 49 minutes ago               happy_leakey
5ec4b92f67c8    ubuntu:latest   "echo 'H ..."  	About an hour ago   Exited (0) About an hour ago            jolly_spence
829914e80f0f	hello-world     "/hello"        7 hours ago         Exited (0) 7 hours ago                  cranky_sammet

```

## Clean Up Your Containers

Yep, when a docker container exits, it hangs around on your system until you
clean it up. This can be really handy for debugging, but we’re done with these
containers for now. Let's remove some of them. You can remove them by ID or by
name, but note that **your ID will be different than mine**!

```
$ docker rm c267f778d237
c267f778d237
```

If you want, you can remove all the other containers listed there too - we won’t
need them anymore. In the future, you might see us pass the `--rm` flag to
`docker run`. That option automatically removes a container when we’re finished
with it so we don’t have to clean it up later.

