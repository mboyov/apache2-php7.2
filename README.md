# Docker stack web by Nutr4x

- DockerHub : [arcadev/apache2-php7.2](https://hub.docker.com/repository/docker/arcadev/apache2-php7.2)
 
## PHP applications on Apache

- Ubuntu 18.04

- Apache 2

- PHP 7.2

## Build

To create the base image arcadev/apache2-php7.2, execute the following command:

docker build -t arcadev/apache2-php7.2 .

Running your Apache and PHP docker image

Start your image binding the external ports 80 in all interfaces to your container:

docker run -d -p 80:80 arcadev/apache2-php7.2

## Compose

In the docker-compose.yml file replace the volume line "/var/www" with your working directory and execute the following command:

docker-compose up
