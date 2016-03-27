#!/bin/bash

DOMAIN=cars.examples.cf
CERTS=../certs
KEYSTORE_NAME=${CERTS}/${DOMAIN}.jks

echo
echo
echo "  Listing the certificates in the keystore."
echo
echo "    keytool -list -v -keystore ${KEYSTORE_NAME}"
echo
echo "  Use the same password you used for generating keystore (e.g. mypassword)"
echo 
echo
echo

keytool -list -v -keystore ../certs/cars.examples.cf.jks


