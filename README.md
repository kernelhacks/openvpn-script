# openvpn-script
Script for to create and revoke the openvpn client.

Working Envaroment
Open Suse
OpenVPN 2.4.4 x86_64
Easy-RSA 3
openSUSE Leap 42.3

The client.sh is the script for to create the VPN files this file edit the client.ovpn with the client name and the server name
you need to edit the client.sh with your own information, maybe you need to change the path of the files too. maybe You can comment the line 23, in this script if you do not use the Hardening Security

The revoke.sh is the script for to revoke the openvpn clients

the client.ovpn is the client openvpn configuration file, this file is copy for each openvpn client that you create
