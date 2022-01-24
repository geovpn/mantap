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
cat /usr/bin/bannerSSH | lolcat
echo -e""
echo -e "${color1}1${color3}.$bd Create SSH & OpenVPN Account (${color2}addssh${color3})"
echo -e "${color1}2${color3}.$bd Trial Account SSH & OpenVPN (${color2}trialssh${color3})"
echo -e "${color1}3${color3}.$bd Renew SSH & OpenVPN Account (${color2}renewssh${color3})"
echo -e "${color1}4${color3}.$bd Delete SSH & OpenVPN Account (${color2}delssh${color3})"
echo -e "${color1}5${color3}.$bd Check User Login SSH & OpenVPN (${color2}cekssh${color3})"
echo -e "${color1}6${color3}.$bd List Member SSH & OpenVPN (${color2}member${color3})"
echo -e "${color1}7${color3}.$bd Delete User Expired SSH & OpenVPN (${color2}delexp${color3})"
echo -e "${color1}8${color3}.$bd Set up Autokill SSH (${color2}autokill${color3})"
echo -e "${color1}9${color3}.$bd Cek Users Who Do Multi Login SSH (${color2}ceklim${color3})"
echo -e "${color1}10${color3}.$bd Restart Services (${color2}restart${color3})"
echo -e""
echo -e "${color1}x${color3}.$bd Menu"
echo -e""
read -p "  Please Enter The Number  [1-9 or x] :  "  ssh
echo -e ""
case $ssh in
1)
addssh
;;
2)
trialssh
;;
3)
renewssh
;;
4)
delssh
;;
5)
cekssh
;;
6)
member
;;
7)
delexp
;;
8)
autokill
;;
9)
ceklim
;;
10)
restart
;;
x)
menu
;;
*)
echo "Masukkan Nomor Yang Ada Sayang!"
sleep 1
menu-ssh
;;
esac

