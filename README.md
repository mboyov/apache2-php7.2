# Docker stack web by Nutr4x

- DockerHub : [nutr4x/apache2-php7](https://hub.docker.com/r/nutr4x/apache2-php7/)
 
## PHP applications on Apache

- Ubuntu 18.04

- Apache 2

- PHP 7.2

## Build

To create the base image nutr4x/apache2-php7, execute the following command:

docker build -t nutr4x/apache2-php7 .

Running your Apache and PHP docker image

Start your image binding the external ports 80 in all interfaces to your container:

docker run -d -p 80:80 nutr4x/apache2-php7

## Compose

Replace the volume line "/jmboy/dev/" with your working directory and execute the following command:

docker-compose up