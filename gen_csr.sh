#!/bin/bash

openssl genrsa -rand /dev/urandom -out $1.key 4096
chmod 0640 $1.key
openssl req -new -rand /dev/urandom -nodes -sha512 -key $1.key -out $1.csr
