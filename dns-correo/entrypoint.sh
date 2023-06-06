#!/bin/bash

service named restart
service postfix restart
service dovecot restart
tail -f /dev/null
