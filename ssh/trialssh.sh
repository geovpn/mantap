#!/bin/bash
# My Telegram : https://t.me/geovpn
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
off='\x1b[m'
# ==========================================
# Getting
MYIP=$(curl -sS ipinfo.io/ip)
echo "Checking VPS"
# Getting
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

BURIQ () {
    curl -sS https://raw.githubusercontent.com/geovpn/perizinan/main/main/allow > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipinfo.io/ip)
Name=$(curl -sS https://raw.githubusercontent.com/geovpn/perizinan/main/main/allow | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipinfo.io/ip)
    IZIN=$(curl -sS https://raw.githubusercontent.com/geovpn/perizinan/main/main/allow | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}
red='\e[1;31m'
green='\e[1;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION

if [ -f /home/needupdate ]; then
red "Your script need to update first !"
exit 0
elif [ "$res" = "Permission Accepted..." ]; then
echo -ne
else
red "Permission Denied!"
exit 0
fi
clear
source /var/lib/geovpnstore/ipvps.conf
if [[ "$IP2" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP2
fi
clear
MYIP=$(curl -sS ipinfo.io/ip)
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
open="$(cat ~/log-install.txt | grep -w "OpenSSH" | cut -d: -f2)"
db="$(cat ~/log-install.txt | grep -w "Dropbear" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ws1="$(cat ~/log-install.txt | grep -w "Websocket SSL" | cut -d: -f2)"
ws2="$(cat ~/log-install.txt | grep -w "Websocket Drop" | cut -d: -f2)"
ws3ovpn="$(cat ~/log-install.txt | grep -w "Websocket Ovpn" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
bad="$(cat ~/log-install.txt | grep -w "Badvpn" | cut -d: -f2)"
ohpp="$(cat ~/log-install.txt | grep -w "OHP" | cut -d: -f2)"
Login=Trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
hari="1"
Pass=1
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
hariini=`date -d "0 days" +"%Y-%m-%d"`
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "\033[0;34m=============================\033[0m"
echo -e "\E[44;1;39m⇱ Thank You For Using Our Services Trial SSH ⇲\E[0m"
echo -e "\E[44;1;39m⇱ OpenVPN & Websocket Account Info ⇲\E[0m"
echo -e "\033[0;34m=============================\033[0m"
echo -e "Username      : $Login"
echo -e "Password      : $Pass"
echo -e "Created       : $hariini"
echo -e "Expired       : $expi "
echo -e "\033[0;34m=============================\033[0m"
echo -e "IP/Host       : ${domain} / $MYIP"
echo -e "OpenSSH       :$open"
echo -e "Dropbear      :$db"
echo -e "SSL/TLS       :$ssl"
echo -e "Port Squid    :$sqd"
echo -e "OHP           :$ohpp"
echo -e "\033[0;34m=============================\033[0m"
echo -e "SSH WS        :$ws2"
echo -e "SSH WS SSL    :$ws1"
echo -e "OpenVPN WS    :$ws3ovpn"
echo -e "\E[44;1;39m=== Payload CDN Websocket ===\E[0m"
echo -e "GET / HTTP/1.1[crlf]Host: ${domain}[crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf]Upgrade: websocket[crlf][crlf]"
echo -e "\033[0;34m=============================\033[0m"
echo -e "Link OpenVPN  : $MYIP:89/"
echo -e "Badvpn        :$bad"
echo -e "\033[0;34m=============================\033[0m"
echo -e ""
echo -e "Script By geovpn"
echo -e ""