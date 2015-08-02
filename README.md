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

##### By running the following command you will get a prompt from ns2 waiting for instructions

`docker run -it  ekiourk/ns2 ns`

##### To run a local tcl script from inside the container.

1. Create a tcl script or download one using `wget http://nile.wpi.edu/NS/Example/ns-simple.tcl` locally

2. Run `docker run -it -v $PWD/ns-simple.tcl:/ns-simple.tcl ekiourk/ns2 ns /ns-simple.tcl` by using the -v flag to put the script from your current directory inside the root directory in the container 

##### Run tcl script with nam.
1. First run container with bash in order to get a prompt inside the container. Make sure you mount the X11 socket and set the DISPLAY environment variable
`docker run -it -v $PWD/ns-simple.tcl:/ns-simple.tcl -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY ekiourk/ns2 bash`

2. After you are inside the container run ns /ns-simple.tcl and NAM should open ready to animate the simulation

If there are problems starting NAM then try to set the argument --cap-add=SYS_ADMIN and run `xhost local:root` on the host

