#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
echo "Script By Geo"
clear
if [[ "$IP2" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$IP2
fi
read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (hari): " masaaktif

IP=$(wget -qO- icanhazip.com);
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
sleep 1
echo Ping Host
echo Cek Hak Akses...
sleep 0.5
echo Permission Accepted
clear
sleep 0.5
echo Membuat Akun: $Login
sleep 0.5
echo Setting Password: $Pass
sleep 0.5
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
created=`date -d "0 days" +"%d-%m-%Y"`
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━"
echo -e " SSH & OpenVPN Account"
echo -e "━━━━━━━━━━━━━━━━━━━━━━"
echo -e "IP            : $IP"
echo -e "Domain        : ${domain}"
echo -e "Username      : $Login "
echo -e "Password      : $Pass"
echo -e "━━━━━━━━━━━━━━━━━━━━━━"
echo -e "OpenSSH       : 22"
echo -e "SSL/TLS       : 789, 777"
echo -e "Dropbear      : 8181, 109, 143"
echo -e "Ws TLS        : 2096"
echo -e "Ws None TLS   : 2095"
echo -e "Ws OVPN       : 2082"
echo -e "Port Squid    : 3128, 8080"
echo -e "Port OVPN TCP : 1194"
echo -e "Port OVPN UDP : 2200"
echo -e "Port OVPN SSL : 442"
echo -e "BadVpn        : 7100-7300"
echo -e "━━━━━━━━━━━━━━━━━━━━━━"
echo -e "       Payload WS     "
echo -e "━━━━━━━━━━━━━━━━━━━━━━"
echo -e "GET / HTTP/1.1[crlf]Host: ${domain}[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "━━━━━━━━━━━━━━━━━━━━━━"
echo -e "  Link Download OVPN  "
echo -e "━━━━━━━━━━━━━━━━━━━━━━"
echo -e "OpenVPN TCP : http://${domain}:81/client-tcp-$ovpn.ovpn"
echo -e "OpenVPN UDP : http://${domain}:81/client-udp-$ovpn2.ovpn"
echo -e "OpenVPN SSL : http://${domain}:81/client-tcp-ssl.ovpn"
echo -e "━━━━━━━━━━━━━━━━━━━━━━"
echo -e "Expired      : $exp"
echo -e "Autoscript by @spacedataxxx"
echo -e "━━━━━━━━━━━━━━━━━━━━━━"
echo -e ""
