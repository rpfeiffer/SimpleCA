#!/bin/bash
# Script revokes existing certificate and creates a new one.
# The script also sets the X.509 extensions for use as a TLS server and client.

if [ -f $1.cert ]
then
    /usr/bin/openssl ca -config openssl.cnf -revoke $1.cert && rm -f $1.cert
fi

/usr/bin/openssl genrsa -out $1.key 4096
chmod 0640 $1.key

/usr/bin/openssl req -new -config openssl.cnf -nodes -sha512 -key $1.key -out $1.csr

export SAN=$1
/usr/bin/openssl ca -batch -rand_serial -config openssl.cnf \
 -subj "/C=AT/ST=Vienna/O=luchs.at/OU=Network Administration/CN=$1" \
 -extfile <(printf "subjectAltName=DNS:$SAN\nkeyUsage = nonRepudiation, digitalSignature, keyEncipherment, dataEncipherment\nextendedKeyUsage = serverAuth, clientAuth") \
 -in $1.csr -out $1.cert && rm $1.csr
