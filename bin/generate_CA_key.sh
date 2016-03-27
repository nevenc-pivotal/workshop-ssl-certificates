#!/bin/bash

DOMAIN=example.com
CERTS=../certs
KEY_NAME=${CERTS}/${DOMAIN}_CA.key

echo
echo
echo "openssl genrsa -out ${KEY_NAME} 2048"
echo
echo

openssl genrsa -out ${KEY_NAME} 2048

echo
echo

STATUS=$?
if [ $STATUS -eq 0 ]
then
  echo "Successfully created ${KEY_NAME}"
else
  echo "Problem creating key."
fi
