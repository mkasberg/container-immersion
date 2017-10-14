---
layout: lab
number: 4
title:  "Cleanup"
---

### Goals
Learn to view and name docker containers and clean them up.

## View Your Containers

Docker comes with a command to view the containers that are currently running on
your system. Let's try it now.

{:.terminal}
```
$ docker ps
CONTAINER ID    IMAGE       COMMAND     CREATED		STATUS      PORTS       NAMES
```

As you might have guessed, nothing’s running. Let's use the `-a` flag to see
*all* containers, including stopped ones.

{:.terminal}
```
$ docker ps -a
CONTAINER ID    IMAGE           COMMAND         CREATED             STATUS                         PORTS    NAMES
c267f778d237    ubuntu:latest   "/bin/bash"     53 minutes ago      Exited (0) 49 minutes ago               happy_leakey
5ec4b92f67c8    ubuntu:latest   "echo 'H ..."  	About an hour ago   Exited (0) About an hour ago            jolly_spence
829914e80f0f	hello-world     "/hello"        7 hours ago         Exited (0) 7 hours ago                  cranky_sammet
```

You might have more than me, depending how many you've started and stopped.
Docker makes up names to refer to your containers. You can use these names
pretty much anywhere you'd use a container ID. If you want, you can give your
own names to containers.

## Name Your Containers

{:.terminal}
```
$ docker run --name my-container ubuntu:latest echo "Hello from my-container."
$ docker ps -a
CONTAINER ID  IMAGE          COMMAND                 CREATED         STATUS                     PORTS  NAMES
71493c47ca90  ubuntu:latest  "echo 'Hello from ..."  26 seconds ago  Exited (0) 24 seconds ago         my-container
. . .
```

By passing `--name my-container`, we ask Docker to use the name we specify
rather than making up it's own. This can be useful to help you keep track of the
different containers you've run.

Even though that container exited immediately, the container still exists on
your system (as discussed in the previous lab). Because of that, you can't
re-use the same name again.

{:.terminal}
```
$ docker run --name my-container ubuntu:latest echo "Hello from my-container."
docker: Error response from daemon: Conflict. The container name "/my-container" is already in use by container
71493c47ca909879977826da53c08d5899680ee07e7e21625a0181f8df141012. You have to
remove (or rename) that container to be able to reuse that name.
See 'docker run --help'.
```

This is an error you might see somewhat frequently if you start using named
containers and forget to clean them up. Let's learn how to fix it.

## Clean Up Your Containers

Yep, when a docker container exits, it hangs around on your system until you
clean it up. This can be really handy for debugging, but we’re done with these
containers for now. Let's remove some of them. You can remove them by ID or by
name. Let's remove `my-container`, along with several others we created in
previous labs but don't need anymore. Note that **your IDs will be different
than mine**!

{:.terminal}
```
$ docker rm my-container
my-container
$ docker rm c267f778d237
c267f778d237
. . .
```

It is perfectly safe to remove any container listed by `docker ps -a` that you
don't want to restart - we won’t need them anymore. In the future, you might see
us pass the `--rm` flag to `docker run`. That option automatically removes a
container when we’re finished with it so we don’t have to clean it up later.

Newer versions of Docker include a command called `docker system prune` that can
help you clean up a large number of stale containers and images from your
system. We'll discuss this in more depth later.
