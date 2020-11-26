#!/bin/bash

mkdir -pv /etc/syslog-ng/ca.d
cd /etc/syslog-ng/ca.d
wget -O digicert_ca.der https://www.digicert.com/CACerts/DigiCertHighAssuranceEVRootCA.crt
openssl x509 -inform der -in digicert_ca.der -out digicert_ca.crt
ln -s digicert_ca.crt `openssl x509 -noout -hash -in digicert_ca.crt`.0

# start
/usr/sbin/syslog-ng -F --no-caps
