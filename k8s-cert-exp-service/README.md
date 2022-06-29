# Golang Service

## Requirements
* [Docker](https://docs.docker.com/get-docker/)

## Run with Docker Compose

### Non detach mode
```bash
docker-compose up
```

### Detach mode
```bash
docker-compose up -d
```

## Stop server

### To shutdown database without remove the container.
```bash
docker-compose stop
```

### To shutdown database and remove the container.
```bash
docker-compose down
```
