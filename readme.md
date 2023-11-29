# Docker container for [fireflyiii-monobank-importer](https://github.com/mariko357/fireflyiii-monobank-importer)

## Building the image:
1. `git clone --recursive https://github.com/mariko357/fireflyiii-monobank-importer-docker.git && cd fireflyiii-monobank-importer-docker && git clone https://github.com/mariko357/fireflyiii-monobank-importer.git`
2. `docker build -t fireflyiii-mono-importer .`

## Usage:
For `importer.env` and `config.yaml` configuration go [here](https://github.com/mariko357/fireflyiii-monobank-importer/tree/1f8e493c044528e6dce37d9fb04b7eef42f51a77#usage).
- ### Docker compose:

```
version: '3.3'

services:
  importer:
    image: fireflyiii-mono-importer
    hostname: importer
    container_name: fireflyiii-importer
    restart: always
    env_file: .importer.env
    networks:
      - fireflyiii
    volumes:
      - /some/location/config.yaml:/app/config.yaml #make sure config.yaml exists before creating the container!
```

- ### Docker cli:

`docker run -d --name fireflyiii-importer --env-file .importer.env -v /some/location/config.yaml:/app/config.yaml`