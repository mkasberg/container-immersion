---
layout: post
title:  "Lab 11: Compose with a Dockerfile"
date:   2017-01-11 01:00:00 -0700
categories: lab
---

### Goals
Integrate a Dockerfile with docker-compose.yml.

## Modify docker-compose.yml

In our last lab, we modified the PHP docker image so that it would have the
pdo_mysql module installed. Now, we want to use that modified version in the
Docker Compose setup we've been working on for our web server.

Modify docker-compose.yml. We want to replace `image: php:7.1-apache` with
`build: ./`. This tells Docker Compose to build the Dockerfile in the same
directory. When you're done, your file should look like this:

**docker-compose.yml**

```
version: '3'

services:

  web:
    build: ./
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

### Test it Out!

Now that we have a PHP container with the pdo_mysql module installed, we can
finally run our website. Run `docker-compose up` and visit
[http://localhost](http://localhost) in your browser. The web container is able
to query data from the db container and return it to the user!

