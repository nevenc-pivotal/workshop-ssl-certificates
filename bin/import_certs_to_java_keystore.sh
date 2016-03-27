#!/bin/bash

DOMAIN=cars.examples.cf
CERTS=../certs

KEY_FILE=${CERTS}/${DOMAIN}.key
FULLCHAIN_FILE=${CERTS}/${DOMAIN}.fullchain
PKCS12_FULLCHAIN_FILE=${CERTS}/${DOMAIN}.fullchain.p12
COMBINED_FILE=${CERTS}/${DOMAIN}.fullchain_with_key
KEYSTORE_FILE=${CERTS}/${DOMAIN}.jks

echo
echo
echo "  Combining Key and Certs."
echo
echo "    cat ${FULLCHAIN_FILE} ${KEY_FILE} > ${COMBINED_FILE}"
echo 
echo

cat ${FULLCHAIN_FILE} ${KEY_FILE} > ${COMBINED_FILE}


echo
echo
echo "  Exporting key and certs (combined) into P12 format."
echo
echo
echo "    openssl pkcs12 -export -in ${COMBINED_FILE} -inkey ${KEY_FILE} -out ${PKCS12_FULLCHAIN_FILE} -name ${DOMAIN}"
echo
echo
echo "  Choose a password for exported PKCS12 file (e.g. mypassword)"
echo
echo

openssl pkcs12 -export -in ${COMBINED_FILE} -inkey ${KEY_FILE} -out ${PKCS12_FULLCHAIN_FILE} -name ${DOMAIN}


echo
echo
echo "  Importing PKCS12 into JKS keystore."
echo
echo "    keytool -importkeystore -destkeystore ${KEYSTORE_FILE} -srckeystore ${PKCS12_FULLCHAIN_FILE} -srcstoretype PKCS12 -alias ${DOMAIN}"
echo
echo
echo "  Use the same password you used for generating keystore (e.g. mypassword)"
echo
echo

keytool -importkeystore -destkeystore ${KEYSTORE_FILE} -srckeystore ${PKCS12_FULLCHAIN_FILE} -srcstoretype PKCS12 -alias ${DOMAIN}

# keytool -import -trustcacerts -alias root -file ${CHAIN_FILE} -keystore ${KEYSTORE_FILE}


