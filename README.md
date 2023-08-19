# lighttpd Docker Service

A [lighttp](https://www.lighttpd.net/) webserver running on [Debian 12 ('bookworm')](https://www.debian.org/releases/stable/), supposed to be used for a service container in a multicontainer setup. It will also work fine on its own.

It's build on top of Debian linux because that's what I needed for most
contexts I'm working in. One reason is often the container needs to run multiple services, e.g., a webserver for outward communication and an SSH server for inward communication with other containers of the same application. (Yes, I'm aware of the whole Docker/VM discussion, and no, I don't care.)

## What’s in It?

The Dockerfile derives from `debian:bookworm-slim` that installs a lighttpd webserver with the APT (so it might not be the most recent version) and sets up the necessary log files.

The `entrypoint` shell script sets some initial log file permissions, routes the error log output to stdout and starts the server.

## Docker Image and Code Repository

You can find a ready-to-use Docker image here:

https://hub.docker.com/r/fpod/lighttpd-docker-service

It's a multi-platform built for various Linux architectures, so there is a good chance it will run on your machine.

If not, you can build your own by downloading the necessary files from this GitHub Repository:

[to do]

## How Do I Turn This Thing On?

If you're using the Docker image out of the box, you can run it directly with

```bash
docker run fpod/lighttpd-docker-service
```

If you run it as part of an application configured with Docker Compose, the minimal configuration to use is

```bash
services:
  webserver:
    image: fpod/lighttpd-docker-service
    ports:
      - 80:80
```

### Additional Configuration

#### Log Files

It's a good idea to mount the log files on your host so you can easily check what's (not) going on.



```bash
docker build -t lighttpd-docker-service .
```
