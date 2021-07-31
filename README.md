# pissircd-docker

## Installation

1. run `gencerts.sh`
2. edit `a.conf` as needed and/or make further configs for more servers, if you make extra configs edit the docker-compose.yml accordingly
3. `docker-compose up -d`
4. `docker exec -it (CONTAINER ID) /app/unrealircd/unrealircd genlinkblock` (hint: run `docker ps` for container id)
