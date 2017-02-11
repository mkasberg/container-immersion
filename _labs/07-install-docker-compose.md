---
layout: lab
number: 7
title:  "Install Docker Compose"
---

### Goals
Install Docker Compose.

## Install Docker Compose

[Docker Compose](https://docs.docker.com/compose/) is a tool that we're going to
be using in upcoming labs to manage multiple Docker containers running at the
same time. Let's make sure it's installed correctly.

### Windows

Docker Compose is part of Docker Toolbox, so it should already be installed.
Verify your installation as below to make sure it works.

### Mac OS X

Docker Compose is part of Docker Toolbox, so it should already be installed.
Verify your installation as below to make sure it works.

### Linux

It is best to install Docker Compose using [the
instructions](https://docs.docker.com/compose/install/) on the Docker website.
Docker Compose is a relatively young piece of software that evolves quickly, and
your distribution's package might not be up to date.

## Verify Your Installation

Verify that you have a recent version of Docker Compose installed.

```
$ docker-compose --version
docker-compose version 1.11.1, build 7c5d5e4
```

