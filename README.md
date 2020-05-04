# QuakeJS Dedicated Server

## Requirements

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Setup

1.  Ensure network ports 80 and 27960 are open

2.  Run `docker-compose up`

3.  Navigate to `127.0.0.1` (for local) or dedicated server IP.

## Server setup

```sh
sudo apt-get update
sudo apt-get install docker.io
git clone https://github.com/mgd020/quakejs.git
alias docker-compose='sudo docker run --rm -it -v "$PWD:$PWD" -v "/var/run/docker.sock:/var/run/docker.sock" -w "$PWD" "docker/compose" '
```
