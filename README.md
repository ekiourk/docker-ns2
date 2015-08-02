# docker-ns2
Network simulator 2 version 2.35 running inside docker

### Base Docker Image

* [ubuntu:10:04](https://registry.hub.docker.com/u/library/ubuntu/)

### Installation

1. Install [Docker](https://www.docker.com/).

2. Download [docker image](https://registry.hub.docker.com/u/ekiourk/ns2/) from public [Docker Hub Registry](https://registry.hub.docker.com/): `docker pull ekiourk/ns2`

   (alternatively, you can build an image from Dockerfile: `docker build -t ns2 github.com/ekiourk/docker-ns2`)

### Validation
The following command will start the container and run all validation tests
* `docker run -it ekiourk/ns2 ./validate`

### Usage
By running the following command you will get a prompt from ns2 waiting for instructions
* `docker run -it  ekiourk/ns2 ns`

