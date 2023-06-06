#!/bin/bash

# INICIAR SERVICIO
service vsftpd restart

# MANTENER CONTENEDOR EJECUTANDOSE
tail -f /dev/null
