# workshop-ssl-certificates

This is a sample repository for various workshops with SSL certificates.


## Useful OpenSSL commands

* Generate private key
```
openssl genrsa -out example.com_CA.key 2048
```

* Generate self-signed certificate
```
openssl req -x509 -new -key example.com_CA.key -sha256 -days 3650 -out example.com_CA.pem
```

* Generate self-signed certificate (from commandline)
```
openssl req -x509 -new \
            -key example.com_CA.key \
            -sha256 \
            -days 3650 \
            -subj '/C=US/ST=California/L=San Francisco/O=Example.COM/OU=IT/CN=example.com/emailAddress=info@example.com' \
            -extensions v3_ca \
            -out ../certs/example.com_CA.pem \

```

* Check certificate
```
openssl x509 -in example.com_CA.pem -text -noout
```

