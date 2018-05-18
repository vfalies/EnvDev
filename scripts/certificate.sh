#!/bin/bash
echo "Enter the name of certificate files: "
read name

echo "Generating an SSL private key to sign your certificate..."
openssl genrsa -des3 -out $name.key 1024

echo "Generating a Certificate Signing Request..."
openssl req -new -key $name.key -out $name.csr

echo "Removing passphrase from key (for nginx)..."
cp $name.key $name.key.org
openssl rsa -in $name.key.org -out $name.key
rm $name.key.org

echo "Generating certificate..."
openssl x509 -req -days 365 -in $name.csr -signkey $name.key -out $name.crt

echo "Moving certificate ($name.crt) to ../conf/ssl/certs/"
mv $name.crt ./conf/ssl/certs/

echo "Moving key ($name.key) to ../conf/ssl/certs/"
mv $name.key ./conf/ssl/certs/

echo "Moving csr ($name.csr) to ../conf/ssl/csr/"
mv $name.csr ./conf/ssl/csr/