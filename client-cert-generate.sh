#! /bin/bash

CA_CERT=$1
CA_KEY=$2

openssl genrsa -des3 -out client-key.pem
openssl req -new -key client-key.pem -out client.csr

echo extendedKeyUsage = clientAuth > extfile.cnf

openssl x509 -req -days 365 -in client.csr -CA $CA_CERT -CAkey $CA_KEY -out client-cert.pem -extfile extfile.cnf

openssl rsa -in server-key.pem -out server-key.pem
openssl rsa -in client-key.pem -out client-key.pem