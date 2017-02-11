---
layout: lab
number: 4
title:  "Apache in Docker"
---

### Goals
Serve an html page from a Docker container.

## Make a Web Page

For this lab, we're going to make a simple website project. Let's start with
something basic.

```
$ mkdir my-docker-website
$ cd my-docker-website
```

Let's make a simple HTML web page. Copy and paste the following HTML into a file
called `index.html` in your `my-docker-website` folder.

**index.html**

```
<html>
<h1>My Website</h1>
<p>This web site is being served from inside a Docker container!</p>
</html>
```

## Serve the Web Page

Now, we're going to serve the web page using a Docker container. We need a
container that runs Apache. A quick search on [Docker
Hub](https://hub.docker.com/) leads us to this [Official Apache
Image](https://hub.docker.com/_/httpd/). Let's use that.

```
$ docker run -d -p 80:80 --name its-apache -v $(pwd):/usr/local/apache2/htdocs/ httpd:2.4
Unable to find image 'httpd:2.4' locally
2.4: Pulling from library/httpd
Digest: sha256:81fa70287ee1d56fb9156f6f89137363c50c40dd088a46568f4c2f7a901e2674
Status: Downloaded newer image for httpd:2.4
7ccd6b46a2e9d04313973713549e590a2cbca356d855cf55a32e4d979933de70
```

Let's break that down:

 - The `-d` flag tells Docker to run in daemon mode.
 - `-p 80:80` maps port 80 on localhost to port 80 inside the container.
 - `--name its-apache` gives our container a name. We'll use this in the next
   lab.
 - `-v $(pwd):/usr/local/apache2/htdocs/` mounts our present working directory
   to `/usr/local/apache2/htdocs/` inside the container.
 - `httpd` is the name of the image we want to use to run our container, and
   `2.4` is the tag.

Although the command returned, our container is indeed running and serving our
website: [http://localhost](http://localhost).

In the next lab, we'll learn more about how to see what Docker's running in the
background.

