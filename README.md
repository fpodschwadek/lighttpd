# lighttpd Docker Service

The provided Dockerfile builds a lighttpd image that is supposed to be used for
a service container in a multicontainer setup.

It's build on top of Debian linux because that's what I needed for most
contexts I'm working in. (There's plenty of Alpine-based images out there if you prefer that particular flavour.)

I don't prefer a Docker image because I neither want to build images for a range of different architectures (ARM64, AMD64, etc.) nor do I want to provide only one image. You can easily build a suitable image for your particular host architecture yourself -- you're using Docker anyway:

```bash
docker build -t lighttpd-docker-service .
```
