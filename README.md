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

### Adding New Module

Add new entry to `./config/modules.json` and open a Pull Request

```
  {
    "name": "mod-transmog", 
    "repo": "https://github.com/azerothcore/mod-transmog", 
    "mod_type": "module", // tool, module, lua-script
    "mod_avatar": "https://raw.githubusercontent.com/azerothcore/mod-transmog/master/icon.png" // optional
  }
```
