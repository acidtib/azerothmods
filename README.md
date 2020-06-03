## azerothmods


### Get Started

Copy the configuration file `.env-example` file into `.env` and update it.

```
$ cp .env-example .env
```

Build and deploy app with Docker

```
$ docker-compose up --build
```

Setup local database:
```
$ docker-compose run app rake db:setup
```

Now you can load [http://localhost:3000](http://localhost:3000) to visit the local site.