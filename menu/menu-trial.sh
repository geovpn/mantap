#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
bl='\e[36;1m'
bd='\e[1m'
color1='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
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
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[44;1;39m        ⇱ Menu Trial ⇲             \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "${color1} 1${color3}.$bd Trial Account WS (${color2}trialv2ray${color3})"
echo -e "${color1} 2${color3}.$bd Trial Account VLESS (${color2}trialvless${color3})"
echo -e "${color1} 3${color3}.$bd Trial Account TR (${color2}trialtrojan${color3})"
echo -e "${color1} 4${color3}.$bd Trial Account SSTP (${color2}trialsstp${color3})"
echo -e "${color1} 5${color3}.$bd Trial Account PPTP (${color2}trialpptp${color3})"
echo -e "${color1} 6${color3}.$bd Trial Account ShadowsocksR (${color2}trialssr${color3})"
echo -e "${color1} 7${color3}.$bd Trial Account Shadowsocks (${color2}trialss${color3})"
echo -e "${color1} 8${color3}.$bd Trial Account L2TP (${color2}triall2tp${color3})"
echo -e "${color1} 9${color3}.$bd Trial Account SSH (${color2}trialssh${color3})"
echo -e "${color1}10${color3}.$bd Trial Account Wireguard (${color2}trialwg${color3})"
echo -e "${color1}11${color3}.$bd Trial Account Trojan-GO (${color2}trialtrgo${color3})"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "${color1}x${color3}.$bd Menu"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -p "  Please Enter The Number  [1-11 or x] :  "  triall
echo -e ""
case $triall in
1)
trialv2ray
;;
2)
trialvless
;;
3)
trialtrojan
;;
4)
trialsstp
;;
5)
trialpptp
;;
6)
trialssr
;;
7)
trialss
;;
8)
triall2tp
;;
9)
trialssh
;;
10)
trialwg
;;
11)
trialtrgo
;;
x)
menu
;;
*)
echo "Masukkan Nomor Yang Ada Sayang!"
sleep 1
triall
;;
esac

