# SimpleCA
Very simple Certificate Authority implemented by a Makefile and OpenSSL. Republished/saved from sial.org.

How to use
----------

Quick and simple:

* Review openssl.conf
* Review Makefile (lifetime of the whole Certificate Authority is stored in there)
* make init
* Edit your system openssl.conf to reflect your most used options
* Create certificate requests by using ./gen_csr.sh common.name
* Sign by doing make sign
* Revoke by issueing: openssl ca -config openssl.cnf -revoke common.name.cert
* Create CRL by issueing: make crl

Make sure you revoke a certificate before renewing it.

