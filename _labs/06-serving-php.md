---
layout: lab
number: 6
title:  "Serving PHP"
---

### Goals
Learn to use find and use more types of containers.

## Add Some PHP

Most websites aren't just HTML. Popular platforms like Wordpress run on PHP.
Let's add some PHP to our own website project. Rename index.html to index.php,
and edit its contents as below:

**index.php**

```
<html>
<h1>My Website</h1>
<p>This web site is being served from inside a Docker container!</p>

<?php
    $today = date("D M j G:i:s T Y");
    print "<p>The current date is $today.</p>";
?>

</html>
```

## Try to Serve It

Let's try to serve our new PHP website from our Apache container.
```
$ docker run -d -p 80:80 --name its-apache -v $(pwd):/usr/local/apache2/htdocs/ httpd:2.4
```

If you visit your webpage at [http://localhost](http://localhost/index.php), it probably
looks funny. None of your PHP was executed! Why not?

## Get a PHP Image

The Apache image we were using for our container does not come with PHP
installed. That's a problem for us if we want to run PHP in our web server.
Later on, we'll learn how to customize a Docker image to add the components we
need. For now, all we need is a really common PHP configuration. Searching
[Docker Hub](https://hub.docker.com/) leads us to the [Official PHP
Image](https://hub.docker.com/_/php/).

Let's try running our website in a Docker container based on that image.
```
$ docker run -d -p 80:80 --name its-php -v $(pwd):/var/www/html php:7.1-apache
```

Although the Apache container serves the `usr/local/apache2/htdocs` directory,
the PHP container serves `/var/www/html`, so we had to change the location where
we mount our Docker volume. The rest of the command is pretty much identical.

One of the best attributes of Docker is the ease with which it can provide a
container with the features you need. When we needed our server to support PHP,
we simply found a container image with that support built in. With Docker, you
can always find or build a container with whatever dependencies you need.

