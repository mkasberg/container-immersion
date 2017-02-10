---
layout: post
title:  "Lab 09: Query the Database"
date:   2017-01-09 01:00:00 -0700
categories: lab
---

### Goals
Make two containers interact using Docker Compose.

## Modify the Website

In our last lab, we created a database container that our website could use.
Let's modify our website to query the database. Edit `index.html` as below. If
you don't completely understand all the code, don't worry! We're focusing on
Docker here, not PHP.

**index.php**

```
<html>
<h1>My Website</h1>
<p>This web site is being served from inside a Docker container!</p>

<?php
    $today = date("D M j G:i:s T Y");
    print "<p>The current date is $today.</p>";
?>
<hr />
<h2>Students</h2>
<?php

    $dbHost = 'db';
    $dbUser = 'my_user';
    $dbPass = 'password';
    $dbName = 'SCHOOL';
    $pdo = new PDO("mysql:host=$dbHost;dbname=$dbName", $dbUser, $dbPass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);    

    $results = $pdo->query('SELECT name, nickname FROM STUDENTS WHERE id < 4');
    $row = $results->fetch(PDO::FETCH_ASSOC);
    while($row !== false) {
        print "<p>{$row['name']} goes by {$row['nickname']}.</p>\n";
        $row = $results->fetch(PDO::FETCH_ASSOC);
    }
?>
</html>
```

Cool! Our website is going to query a database, and it's all happening in
Docker!

Wait a minute... If you try to visit the website at
[http://localhost](http://localhost), you'll see an error message. `Fatal error:
Uncaught PDOException: could not find driver in /var/www/html/index.php:13`.
That's not good. As it turns out, we're missing the `pdo_mysql` PHP module in
our PHP container. In the next lab, we'll learn how to fix that.

