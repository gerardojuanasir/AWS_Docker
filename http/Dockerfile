# IMAGEN BASE
FROM ubuntu:22.04

# CREADORES DE LA IMAGEN
MAINTAINER Gerardo Robustiello Torres, Juan Manuel Nodal Corona "gerardojuanasir@gmail.com"

# INSTALACION
RUN apt-get update && apt-get install -y apache2
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

# COPIA DE FICHEROS
COPY index.html /var/www/html
COPY logo.png /var/www/html

# PUERTOS
EXPOSE 80
EXPOSE 443

# INICIO DEL SERVICIO
CMD ["apache2ctl", "-D", "FOREGROUND"]
