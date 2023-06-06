# IMAGEN BASE
FROM ubuntu:22.04

# CREADORES DE LA IMAGEN
MAINTAINER Gerardo Robustiello Torres, Juan Manuel Nodal Corona "gerardojuanasir@gmail.com"

# INSTALACION
RUN apt-get update && apt-get install -y vsftpd
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

# COPIA DE FICHEROS
COPY vsftpd.conf /etc

# CONFIGURACION ADICIONAL
RUN mkdir -p /var/ftp/anonimo
RUN touch /var/ftp/anonimo/prueba.txt
RUN chmod 775 /var/ftp/anonimo
RUN addgroup ftp_user
RUN chown nobody:ftp_user /var/ftp/anonimo

# PUERTOS
EXPOSE 20
EXPOSE 21
EXPOSE 40000-40005

# INICIO DEL SERVICIO
COPY entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

