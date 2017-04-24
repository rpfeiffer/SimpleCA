#!/bin/bash

openssl pkcs12 -export -in $1.cert -inkey $1.key -out $1.p12
