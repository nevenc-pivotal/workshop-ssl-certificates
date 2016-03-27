#!/bin/bash

DOMAIN=example.com
CERTS=../certs
KEY_NAME=${CERTS}/${DOMAIN}_CA.key
CERT_NAME=${CERTS}/${DOMAIN}_CA.pem


echo
echo
echo "openssl req -x509 -new \\"
echo "            -key ${KEY_NAME} \\"
echo "            -sha256 \\"
echo "            -days 3650 \\"
echo "            -subj '/C=US/ST=California/L=San Francisco/O=Example.COM/OU=IT/CN=${DOMAIN}/emailAddress=info@${DOMAIN}' \\"
echo "            -extensions v3_ca \\"
echo "            -out ${CERT_NAME} \\"
echo 
echo 

openssl req -x509 -new \
            -key ${KEY_NAME} \
            -sha256 \
            -days 3650 \
            -subj '/C=US/ST=California/L=San Francisco/O=Example.COM/OU=IT/CN=${DOMAIN}/emailAddress=info@${DOMAIN}' \
            -extensions v3_ca \
            -out ${CERT_NAME} \


STATUS=$?
if [ $STATUS -eq 0 ]
then
  echo "Successfully created ${CERT_NAME}"
else
  echo "Problem creating certificate."
fi
