---
layout: post
title:  "Lab 08: Add a Database"
date:   2017-01-08 01:00:00 -0700
categories: lab
---

### Goals
Use Docker Compose to add a database to our project.

## Create docker-compose.yml

Running PHP on an Apache server is great, but most web applications also need a
database. Often, this database runs on a system separate from the web server.
[Docker Compose](https://docs.docker.com/compose/) is a tool that makes it easy
to configure several Docker containers at once and create a network between
them. For this project, we're going to use a Docker image that runs
[MySQL](https://hub.docker.com/_/mysql/).

All configuration for Docker Compose is driven by a file called
docker-compose.yml. Compose looks for this file in the current directory. Let's
add it to our website project (as a file in the `my-docker-website`
directory).

**docker-compose.yml**

```
version: '3'

services:

  web:
    image: php:7.1-apache
    depends_on:
      - db
    volumes:
      - ./:/var/www/html
    ports:
      - "80:80"

  db:
    image: mysql:5.6
    environment:
      - MYSQL_ROOT_PASSWORD=password
      - MYSQL_DATABASE=SCHOOL
      - MYSQL_USER=my_user
      - MYSQL_PASSWORD=password
    volumes:
      - ./docker-entrypoint-initdb.d:/docker-entrypoint-initdb.d
    ports:
      - "3306:3306"

```

Let's break that down. If you're curious, you can also follow along in the
[docker-compose.yml docs](https://docs.docker.com/compose/compose-file).

 - We're using version 3 of the docker-compose.yml file format.
 - We have 2 "services" or "containers". One for the web server, and one for the
   database.
 - You'll recognize most of the configuration options for our web server.
   They're the same ones we passed on the command line in a previous lab.
 - We're setting several environment variables to configure our database. These
   are documented on the [MySQL Docker Hub](https://hub.docker.com/_/mysql/)
   page.
 - We're mounting `./docker-entrypoint-initdb.d` from our host into
   `/docker-entrypoint-initdb.d` in our MySQL container. This is also documented
   on the MySQL Docker Hub page.
 - We're forwarding port 3306 so we can connect to the database on localhost.

We're going to want some data in our database. Download this [SCHOOL.sql]({{
site.github.url }}/files/SCHOOL.sql) file to
`my-docker-website/docker-entrypoint-initdb.d/SCHOOL.sql` so that it can be used
to initialize our database.

At this point, you could run `docker-compose up`, but nothing interesting would
happen because our web server doesn't interact with our database yet. In the
next lab, we'll add some new functionality to our web server.

