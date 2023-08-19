# lighttpd Docker Service

A [lighttp](https://www.lighttpd.net/) webserver running on [Debian 12 ('bookworm')](https://www.debian.org/releases/stable/), supposed to be used for a service container in a multi-container setup. It will also work fine on its own.

It's build on top of Debian linux because that's what I needed for most
contexts I'm working in. One reason is that often the same container needs to run multiple services, e.g., a webserver for outward communication and an SSH server for inward communication with other containers of the same application. You don't get that with available Alpine variants. (Yes, I'm aware of the whole Docker/VM discussion, and no, I don't care.)

## What’s in It?

The Dockerfile derives from `debian:bookworm-slim` and installs a lighttpd webserver with the APT (so it might not be the most recent version, currently it's 1.4.69) and sets up the necessary log files.

The `entrypoint` shell script sets some initial log file permissions, routes the error log output to stdout and starts the server.

The repository also contains an example `docker-compose.yml` file that can be used to start the container.

## Docker Image and Code Repository

You can find a ready-to-use Docker image here:

https://hub.docker.com/r/fpod/lighttpd-docker-service

It's a multi-platform built for various Linux architectures, so there is a good chance it will run on your machine.

If not, you can build your own after downloading the necessary files from the GitHub Repository:

https://github.com/fpodschwadek/lighttpd

Here you'll also find the example Docker Compose configuration file. I you want to run the container from this file, you should clone the complete repository.

## How Do I Turn This Thing On?

If you're using the Docker image out of the box, you can run it directly with

```bash
docker run fpod/lighttpd-docker-service
```

If you run it as part of an application configured with Docker Compose, the minimal configuration to use is

```
services:
  webserver:
    image: fpod/lighttpd-docker-service
    ports:
      - 80:80
```

You can also use the example `docker-compose.yml` file for more options. You can start the container with the example configuration by running

```bash
docker compose --env-file .env.example up -d
```

## Additional Configuration

### Webserver Configuration

You can mount configuration files into the container to add or override the configuration for the lighttpd webserver.

The main configuration file in the container is `/etc/lighttpd/lighttpd.conf`. You can mount a file from your host to `/etc/lighttpd/lighttpd.conf` to override the default configuration.

Most of the time this should not be needed. The provided configuration already loads `mod_indexfile`, `mod_access`, `mod_alias`, `mod_redirect`, `mod_dirlisting`, and `mod_staticfile`, is set up to accept the index file names "index.php", "index.html", "index.lighttpd.html", and runs the server as `www-data` in the container.

You can provide additional configuration for your project by mounting a configuration file from your host to the container folder `/etc/lighttpd/conf-enabled/{ custom config file name}`. lighttpd includes all files from this folder, so you can mount several files or a hole host folder here if you want.

### Document Root

The default document root in the container is `/var/www/html`. You can mount a folder from your host to this folder to provide your own content. You can also configure lighttpd to use a different document root and mount your content there.

### Log Files

It's a good idea to mount the log files on your host so you can easily check what's (not) going on. 

The lighttps log files are located in `/var/log/lighttpd` in the container. Mount a host folder here for easy debugging.

## License

All files in the repository are released under a BSD-3-Clause license, same as lighttpd itself.
