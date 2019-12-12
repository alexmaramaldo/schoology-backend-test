# Alex Maramaldo #schoology!

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

# Before everything

I created this project in half day, I tried using a little bit for the most part important from my skills, the system has particular parts purposeful, per example, Models with public vars, without use getter's and setter's, I won time in this case, I used TDD with PHPUNIT in a one simple test, :), If you have any questions, don't leave call me, I can help you to understand my idea, Hugs and I hope to see you coming soon!

To layout, I created a simple interface to interact with the user!

# Tech specification

The project uses `PHP 7.2` and `MySQL`

_Folder structure_

    .
    ├── ...
    ├── Config          # Folder with db.php
    ├── Controllers     # All controllers from projects
    ├── Core            # Base classes and parent classes
    ├── docker          # Structure to run docker-compose
    ├── Models          # All models from project
    ├── Repositories    # All repositories from projects, responsible to manipulate data inside of MySQL
    ├── vendor          # GAll tests from project
    ├── vendor          # Generate by composer.json
    ├── Webroot         # Default Web Root from project

# Description

1. The system was created to search Suggestions.
2. Created using PHP from scratch, I don't used a PHP Framework, I created literally my owner framework to this Code Challenge, using MVC structure, with Repositories, Router, Dispatchers and others, I hope you like this.
3. The project has Webroot, this is the ROOT folder, you need to appointment your server to here.
4. I used the composer to load my classes and phpdotenv to load envvars.
5. If you will run locally, you need set on .env the credentials for the database.
6. If you have `docker compose` and you want to use:
   - You need to run: `docker-compose up`
   - and after, you will have MySQL running in `127.0.0.1`, port `3306`, user: `root`, password: `root` and database: `homestead`
   - You will need to import `dump_mysql.sql`.
   - You access in url
   - - GET `http://localhost:8000/suggestions/index/{stringPartOfSuggestion}`
   - - POST `http://localhost:8000/suggestions/create`
   - - - Request BODY: `{ "name": "My new Suggestion Here"}`
7. The project has more parts from a system(delete, findById, update, etc), you can check others posibilities on code, but, I not implemeted on the API.

> (\*) If you have a problem to run this, you can contact directly me in e-mail: `alexmaramaldo@gmail.com`

# Requirements if you need to create a custom server:

If you need put the project inside linux server, you need to install APACHE 2 or NGINX or Similar, but you need PHP 7.2 and sub modules and MySQL or MariaDB(preferably).
Example command with apache::

```sh
$ sudo apt-get update && apt-get -y upgrade && apt-get -y install \
  apache2 php7.2 libapache2-mod-php7.2 curl php7.2-curl php7.2-simplexml php7.2-mysql mysql-server && a2enmod php7.2
```

And point the root directory to folder Webroot
