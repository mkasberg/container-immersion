---
layout: lab
number: 5
title:  "What's Running?"
---

### Goals
See what Docker containers are currently running. Learn to interact with them
and clean them up.

## Find Our Apache Container

If you just completed the previous lab, your Apache container should be serving
your web page. Let's see if it's running:

```
$ docker ps
CONTAINER ID    IMAGE       COMMAND     	CREATED		STATUS      	PORTS       		NAMES
7ccd6b46a2e9	httpd:2.4   "httpd-foreground"  7 minutes ago	Up 7 minutes    0.0.0.0:80->80/tcp   	its-apache
```

`docker ps` lists the Docker containers that are currently running on our
system. Because our Apache container is running in daemon mode, we need to use
`docker ps` to see it running. The `docker ps` command gives us some basic
information about uptime, our container ID, and the ports its using.

Let's get some more info from the container. We can use `docker logs` to see
what Apache's logging.

```
$ docker logs its-apache
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
[Tue Feb 07 04:20:00.800191 2017] [mpm_event:notice] [pid 1:tid 140506626602880] AH00489: Apache/2.4.25 (Unix) configured -- resuming normal operations
[Tue Feb 07 04:20:00.800370 2017] [core:notice] [pid 1:tid 140506626602880] AH00094: Command line: 'httpd -D FOREGROUND'
172.17.0.1 - - [07/Feb/2017:04:24:02 +0000] "GET / HTTP/1.1" 200 105
```

`docker logs` is a command that shows us logs from one of our docker containers.
Normally, a Docker log comes from stdout of the process that's running in the
container. In this case, we referred to the container by its name, `its-apache`.
We could also have used the container ID - names and IDs are normally
interchangeable in Docker commands.

