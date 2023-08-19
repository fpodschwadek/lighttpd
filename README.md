# lighttpd Docker Service

The provided Dockerfile builds a lighttpd image that is supposed to be used for
a service container in a multicontainer setup.

It's build on top of Debian linux because that's what I needed for most
contexts I'm working in. (There's plenty of Alpine-based images out there if you prefer that particular flavour.)

```bash
docker build -t lighttpd-docker-service .
```
