#!/bin/bash
echo "Enter the name of certificate files: "
read name

echo "Regenerating certificate..."
openssl x509 -req -days 365 -in ./conf/ssl/csr/$name.csr -signkey ./conf/ssl/certs/$name.key -out ./conf/ssl/certs/$name.crt