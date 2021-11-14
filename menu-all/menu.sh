#!/bin/bash
yl='\e[031;1m'
bl='\e[36;1m'
gl='\e[32;1m'

clear 
cat /usr/bin/bannerku | lolcat
echo -e ""
echo -e ""
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
IPVPS=$(curl -s ipinfo.io/ip )
DOMAIN=$(cat /etc/v2ray/domain)
	cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -m | awk 'NR==2 {print $2}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )
	up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')

	echo -e "   \e[032;1mCPU Type :\e[0m $cname"
	echo -e "   \e[032;1mCores    :\e[0m $cores"
	echo -e "   \e[032;1mCPU Freq :\e[0m $freq MHz"
	echo -e "   \e[032;1mRAM      :\e[0m $tram MB"
	echo -e "   \e[032;1mUptime   :\e[0m $up"
	echo -e "   \e[032;1mIsp      :\e[0m $ISP"
	echo -e "   \e[032;1mCity     :\e[0m $CITY"
	echo -e "   \e[032;1mTime     :\e[0m $WKT"
	echo -e "   \e[032;1mIP VPS   :\e[0m $IPVPS"
	echo -e "   \e[032;1mDomain   :\e[0m $DOMAIN"
echo -e   ""
echo -e   "  \e[1;32m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e" | lolcat
echo -e   "                             MENU OPTION\e" | lolcat 
echo -e   "  \e[1;32m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e" | lolcat
echo -e   "   1\e[1;33m)\e[m Panel SSH-WS & OpenVPN "
echo -e   "   2\e[1;33m)\e[m Panel Wireguard "
echo -e   "   3\e[1;33m)\e[m Panel L2TP & PPTP "
echo -e   "   4\e[1;33m)\e[m Panel SSTP "
echo -e   "   5\e[1;33m)\e[m Panel SSR & SS "
echo -e   "   6\e[1;33m)\e[m Panel Vmess"
echo -e   "   7\e[1;33m)\e[m Panel Vless"
echo -e   "   8\e[1;33m)\e[m Panel Trojan"
echo -e   "  \e[1;32m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e" | lolcat
echo -e   "                             SYSTEM MENU\e" | lolcat 
echo -e   "  \e[1;32m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e" | lolcat
echo -e   "   9\e[1;33m)\e[m   Add or Change Subdomain Host For VPS"
echo -e   "   10\e[1;33m)\e[m  Renew Certificate V2ray"
echo -e   "   11\e[1;33m)\e[m  Change Port All Service"
echo -e   "   12\e[1;33m)\e[m  Autobackup Data VPS"
echo -e   "   13\e[1;33m)\e[m  Backup Data VPS"
echo -e   "   14\e[1;33m)\e[m  Restore Data VPS"
echo -e   "   15\e[1;33m)\e[m  Install Webmin Menu"
echo -e   "   16\e[1;33m)\e[m  Limit Bandwith Speed Server"
echo -e   "   17\e[1;33m)\e[m  Check Usage of VPS Ram" 
echo -e   "   18\e[1;33m)\e[m  Reboot System"
echo -e   "   19\e[1;33m)\e[m  Speedtest VPS"
echo -e   "   20\e[1;33m)\e[m  Information Display System" 
echo -e   "   21\e[1;33m)\e[m  Info Script Auto Install"
echo -e   "   22\e[1;33m)\e[m  Install BBR"
echo -e   "   23\e[1;33m)\e[m  Add ID Cloudflare"
echo -e   "   24\e[1;33m)\e[m  Cloudflare Add-Ons"
echo -e   "   25\e[1;33m)\e[m  Pointing BUG"
echo -e   "   26\e[1;33m)\e[m  Clear Log"
echo -e   "   27\e[1;33m)\e[m  Setup Auto Reboot"
echo -e   "   28\e[1;33m)\e[m  Checking Running Service"
echo -e   "   29\e[1;33m)\e[m  Manage VPS"
echo -e   "   30\e[1;33m)\e[m  Install DDoS Protection ( WAJIB )"
echo -e   "  \e[1;32m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e" | lolcat
echo -e   "   x)   Exit" | lolcat
echo -e   "  \e[1;32m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e" | lolcat
echo -e   ""
read -p "     Select From Options [1-30 or x] :  " menu
echo -e   ""
case $menu in
1)
ssh
;;
2)
wgr
;;
3)
l2tp
;;
4)
sstpp
;;
5)
ssssr
;;
6)
v2raay
;;
7)
vleess
;;
8)
trojaan
;;
9)
add-host
;;
10)
certv2ray
;;
11)
change-port
;;
12)
autobackup
;;
13)
backup
;;
14)
restore
;;
15)
wbmn
;;
16)
limit-speed
;;
17)
ram
;;
18)
reboot
;;
19)
speedtest
;;
20)
info
;;
21)
about
;;
22)
bbr
;;
23)
cff
;;
24)
cfd
;;
25)
cfh
;;
26)
clear-log
;;
27)
autoreboot
;;
28)
geo
;;
29)
format
;;
30)
rm -rf paket.sh && apt install curl && wget https://raw.githubusercontent.com/akmalcoeg19/autosc/main/menu-all/paket.sh && apt update && apt install dos2unix && dos2unix paket.sh && chmod +x paket.sh && ./paket.sh
;;
31)
systemctl restart shadowsocks-libev-server@tls && systemctl restart shadowsocks-libev-server@http
;;
x)
exit
;;
*)
clear
menu
;;
esac
