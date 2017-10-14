---
layout: lab
number: 6
title:  "What's Running?"
---

### Goals
See what Docker containers are currently running. Learn to interact with them
and clean them up.

## Find Our Apache Container

If you just completed the previous lab, your Apache container should still be
running,  serving your web page. Let's see:

{:.terminal}
```
$ docker ps
CONTAINER ID    IMAGE       COMMAND     	CREATED		STATUS      	PORTS       		NAMES
7ccd6b46a2e9	httpd:2.4   "httpd-foreground"  7 minutes ago	Up 7 minutes    0.0.0.0:80->80/tcp   	its-apache
```

`docker ps` lists the Docker containers that are currently running on our
system. Because our Apache container is running in daemon mode, we need to use
`docker ps` to see it running. The `docker ps` command gives us some basic
information about uptime, our container ID, and the ports its using.

## View Logs

Let's get some more info from the container. We can use `docker logs` to see
what Apache's logging.

{:.terminal}
```
$ docker logs its-apache
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
[Tue Feb 07 04:20:00.800191 2017] [mpm_event:notice] [pid 1:tid 140506626602880] AH00489: Apache/2.4.25 (Unix) configured -- resuming normal operations
[Tue Feb 07 04:20:00.800370 2017] [core:notice] [pid 1:tid 140506626602880] AH00094: Command line: 'httpd -D FOREGROUND'
172.17.0.1 - - [07/Feb/2017:04:24:02 +0000] "GET / HTTP/1.1" 200 105
```

The logs from our its-apache container show us everything apache's logging. You
should be able to see HTTP requests in the logs as you make them from your
browser. This is pretty neat - the `docker logs` command is actually showing us
the logs from the process (in this case, Apache httpd) that's running _inside_ the
container.

## Stopping the Container

The container will continue to run in daemon mode until you stop it. Let's stop
the container now, before moving on to the next lab.

{:.terminal}
```
$ docker stop its-apache
```
