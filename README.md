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
# install docker
wget -qO- https://get.docker.com/ | sh

# set up docker-compose
printf '#!/bin/sh\n\ndocker run --rm -it -v "$PWD:$PWD" -v "/var/run/docker.sock:/var/run/docker.sock" -w "$PWD" docker/compose $@\n' | sudo tee -a /usr/local/bin/docker-compose >/dev/null && sudo chmod +x /usr/local/bin/docker-compose

# pull down code
git clone https://github.com/mgd020/quakejs.git

# start up server
sudo docker-compose up
```
