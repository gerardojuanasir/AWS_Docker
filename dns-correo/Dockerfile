#Imagen base
FROM ubuntu:22.04

#Autores de la imagen
MAINTAINER Gerardo Robustiello Torres, Juan Manuel Nodal Corona "gerardojuanasir@gmail.com"

#Instalación DNS
RUN apt-get update && apt-get install -y bind9 bind9utils

#Ficheros dns
COPY db.empresa.asir /etc/bind
COPY db.1.98.10 /etc/bind
COPY db.1.168.192 /etc/bind
COPY db.112.236.15 /etc/bind
COPY named.conf.local /etc/bind
COPY named.conf.options /etc/bind

#Puertos DNS
EXPOSE 53/tcp
EXPOSE 53/udp
EXPOSE 953/tcp
EXPOSE 953/udp

#Instalacion correo
RUN echo 'postfix postfix/main_mailer_type select No configuration' | debconf-set-selections &&\
    DEBIAN_FRONTEND=noninteractive apt-get install -y postfix sasl2-bin
RUN dpkg-reconfigure -f noninteractive postfix
RUN apt-get install -y dovecot-core dovecot-pop3d dovecot-imapd mailutils
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

#Ficheros de correo
COPY main.cf /etc/postfix
COPY dovecot.conf /etc/dovecot
COPY 10-auth.conf /etc/dovecot/conf.d
COPY 10-mail.conf /etc/dovecot/conf.d
COPY 10-master.conf /etc/dovecot/conf.d
COPY mailutils.conf /etc

#Puertos correo
EXPOSE 25
EXPOSE 465
EXPOSE 143
EXPOSE 993
EXPOSE 110
EXPOSE 995

#Configuracion extra
RUN newaliases
ENV USUARIO1 director
ENV PASSWORD1 director
ENV USUARIO2 empleado
ENV PASSWORD2 empleado
RUN useradd -m -p $(openssl passwd -1 $PASSWORD1) $USUARIO1
RUN useradd -m -p $(openssl passwd -1 $PASSWORD2) $USUARIO2

#Inicio servicios
COPY entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
