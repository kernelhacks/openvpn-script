#!/bin/bash

echo Please enter the VPN ID that you want revoke
read vpnid
easyrsa revoke $vpnid

echo run gen-crl and upload a CRL...
easyrsa gen-crl
echo DONE

echo Clining VPN files reg, crt, key and zip from the system ...
rm -f /etc/easy-rsa/pki/reqs/$vpnid.req
rm -f /etc/easy-rsa/pki/issued/$vpnid.crt
rm -f /etc/easy-rsa/pki/private/$vpnid.key
rm -f /etc/openvpn/visiogroupserver/clients/$vpnid.zip
echo Complete...
