---
layout: lab
number: 14
title:  "Push to Docker Hub"
---

### Goals
Push a Docker image to Docker Hub to make it publicly available.

## Background

Last lab, we learned how to make a releasable Docker image. We built with the
tag `yourname/container-immersion:latest`. In this lab, we're going to push that
image up to Docker Hub.

**Note:** It is important for this lab that you replace `yourname` with your
_actual Docker Hub username_ so that you have the correct permissions to push to
that repository.

You should see your docker image already tagged (from the previous lab) when you
run the `docker images` command:

{:.terminal}
```
$ docker images
REPOSITORY                   TAG    IMAGE ID     CREATED      SIZE
yourname/container-immersion latest 3283d8586d91 21 hours ago 375MB
```

## Create a Docker Hub Repository

To do this lab, you'll need an account on [Docker Hub](https://hub.docker.com).
If you don't already have one, you should create one now.

Once you're logged in, use the "Create Repository" button to make a new
repository. Name your repository "container-immersion", and give it a
description.

![Create a repository on Docker
Hub]({{ '/assets/img/DockerHub-ContainerImmersion.png' | relative_url }}){:.img-responsive}

## Login

Before you can push your Docker image to your newly created repository, you'll
need to log in. You do this from the command line:

{:.terminal}
```
$ docker login
Login with your Docker ID to push and pull images from Docker Hub. If you don't
have a Docker ID, head over to https://hub.docker.com to create one.
Username: yourname
Password: 
Login Succeeded
```

## Push a Docker Image

Now that you're logged in, you'll have rights to push your image up to Docker
Hub with the `docker push` command. You can push any image that shows up when
you run `docker images`, as long as you have push rights to the repository
you're trying to push to:

{:.terminal}
```
$ docker push yourname/container-immersion:latest
The push refers to a repository [docker.io/yourname/container-immersion]
4cf6a9a608f4: Pushed 
 . . .
cec7521cdf36: Pushed 
latest: digest:
sha256:0d4f564f97eb1f16d2de4f720b04f6b54b3626dea90e4ce1e22766b5aca9c6a6 size: 1578
```
## Summary

Congratulations, you've pushed your first image to Docker Hub. It's worth noting
here that it's common for this process to be automated. Many developers commit
their Dockerfiles to repositories on Github and use a web hook to trigger
automatic builds on Docker Hub whenever a new commit is pushed. But the basic
principles are the same.

Now that your image is available on Docker Hub, anyone in the world can run your
image very easily:

{:.terminal}
```
$ docker run --rm yourname/container-immersion:latest
Unable to find image 'yourname/container-immersion:latest' locally
latest: Pulling from yourname/container-immersion
 . . .
```

Even though they don't have the image or the Dockerfile locally, Docker will
find the image on Docker Hub and automatically pull it down.
