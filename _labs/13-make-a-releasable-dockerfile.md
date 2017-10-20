---
layout: lab
number: 13
title:  "Make a Releasable Dockerfile"
---

### Goals
Create a Dockerfile that we could release, for example on
[hub.docker.com](https://hub.docker.com).

## Background

So far, we have not written any Dockerfiles intended to be released. They were
all designed to help us with local development. In this lab, we'll learn how to
write and debug a Dockerfile intended for public use. That is, you could upload
something like this to Docker Hub.

For our example, let's create a Dockerfile for this website (Container
Immersion). This Docker container will work much like the Apache container from
our previous labs. The difference will be that instead of sharing a project
directory from the host machine, the Docker image itself will contain a working
version of the website.

## Start with a Base

So our goal is to make a container image that has a website pre-installed. Let's
use [NGINX](https://www.nginx.com/resources/wiki/) for some variety. Whenever
you use a new base image for the first time, it's useful to read about it on
Docker Hub: [https://hub.docker.com/\_/nginx/](https://hub.docker.com/_/nginx/).

Let's start our Dockerfile then:

**Dockerfile**

```docker
FROM nginx:stable

```

There's the first line of our Dockerfile. Well, what next?

## Experiment with the Container

We want to install our website into the container. When building a container
from scratch, it's sometimes useful to experiment a little. Let's build our
Dockerfile as it is now, and experiment in a shell:

{:.terminal}
```
$ docker build -t yourname/container-immersion:latest .
$ docker run --rm -it -p 80:80 yourname/container-immersion:latest /bin/bash
```

Now (inside the container), let's download the code for the site:

{:.terminal}
```
# apt-get update && apt-get install -y wget
# cd /root
# wget https://github.com/mkasberg/container-immersion/archive/master.zip
# apt-get install -y unzip
# unzip master.zip
# apt-get install -y jekyll
# cd container-immersion-master
# jekyll build -d /usr/share/nginx/html
# nginx -g "daemon off;"
```

NGINX is now serving our site! You can view it at [localhost](http://localhost)
since we bound the container to port 80. When you're done, use `^C` and `exit` to
get out of the container.

## Add to the Dockerfile

So that's what we need to do to build and serve the site. Now, let's do it in our
Dockerfile. You'll notice that we clean a few lines up (since we know exactly
what we need to do), but the commands we're using are essentially the same.

**Dockerfile**

```docker
FROM nginx:stable

# Install some tools.
RUN apt-get update && apt-get install -y wget unzip jekyll

# Download and unzip the sources for the site.
WORKDIR /root
RUN wget https://github.com/mkasberg/container-immersion/archive/master.zip && \
    unzip master.zip

# Build the site.
RUN jekyll build -s /root/container-immersion-master -d /usr/share/nginx/html

# Serve the site.
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

Put that in your Dockerfile. Then rebuild and run:

{:.terminal}
```
$ docker build -t yourname/container-immersion:latest .
$ docker run --rm -p 80:80 yourname/container-immersion:latest
```

Notice that this time, we left off `-it` (since we won't be interacting with the
terminal) and we also left off `/bin/bash` (since we're using the default
command from the Dockerfile). Check [localhost](http://localhost) to see the
website again (since we _did_ bind port 80).

## Summary

Now that we've done that, here's a few additional notes:

 * Although we only ran an interactive shell once, it's common to go through
   many iterations of switching between an interactive shell and editing the
   Dockerfile, as a debugging technique.
 * Our image is relatively large because we installed Jekyll inside it. But
   we're not using Jekyll to serve the pages! We could make our image smaller by
   uninstalling it after the build finishes, or by building outside our image.

Congratulations, you've built an entirely self-contained Docker image from
scratch that contains a website (and everything needed to serve it). In the next
lab, we'll look at putting images like this one on Docker Hub.

