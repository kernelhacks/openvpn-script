#!/bin/bash
echo Please enter start position of the VPN ID
read start

echo Please enter the lasted position of the VPN ID
read end
while (( $start <= $end ));
do
#build the Open Vpn Files
  easyrsa build-client-full OVPN$start nopass

#Creating the Directory for the VPN files
  mkdir OVPN$start

# Editing the ovpn file
  sed s/myserver/OVPN$start/ <client.ovpn >OVPN$start/OVPN$start.ovpn
  sed s/clientfiles/OVPN$start/ <client.ovpn >OVPN$start/OVPN$start.ovpn

#Enter to the Client VPN directory
  cd OVPN$start

#Copy the key,crt files from the original location en paste in the client
#directory.
  cp ../ta.key . # You can comment this line if do not use the Hardening Security
  cp /etc/easy-rsa/pki/issued/OVPN$start.crt .
  cp /etc/easy-rsa/pki/private/OVPN$start.key .
  cp /etc/easy-rsa/pki/ca.crt .

#Exit fromn the Client directory
  cd ..

#Compresing the Client directory
  zip -r OVPN$start.zip OVPN$start

#Removing the client directory
  rm -rf OVPN$start
# echo "This mail has the VPN attached" | mailx -s "New VPN Client OVPN$start" -a OVPN$start.zip dpochet@nibbletec.com
start=$(( start+1 ))
done
