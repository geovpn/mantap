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
cat /usr/bin/bannerSYSTEM | lolcat
echo -e""
echo -e "${color1} 1${color3}.$bd Change Port All Account (${color2}changeport${color3})"
echo -e "${color1} 2${color3}.$bd Webmin Menu (${color2}wbmn${color3})"
echo -e "${color1} 3${color3}.$bd Limit Bandwith Speed Server (${color2}limitspeed${color3})"
echo -e "${color1} 4${color3}.$bd Check Usage of VPS Ram (${color2}ram${color3})"
echo -e "${color1} 5${color3}.$bd Reboot VPS (${color2}reboot${color3})"
echo -e "${color1} 6${color3}.$bd Speedtest VPS (${color2}speedtest${color3})"
echo -e "${color1} 7${color3}.$bd Information Display System (${color2}info${color3})"
echo -e "${color1} 8${color3}.$bd Info Script Auto Install (${color2}about${color3})"
echo -e "${color1} 9${color3}.$bd Clear Log (${color2}clearlog${color3})"
echo -e "${color1}10${color3}.$bd Auto Reboot (${color2}autoreboot${color3})"
echo -e "${color1}11${color3}.$bd Service Status (${color2}status${color3})"
echo -e "${color1}12${color3}.$bd Cek Bandwidth VPS (${color2}bw${color3})"
echo -e "${color1}13${color3}.$bd Install BBR (${color2}bbr${color3})"
echo -e "${color1}14${color3}.$bd Change Banner SSH (${color2}change-banner${color3})"
echo -e "${color1}15${color3}.$bd Ganti Pass VPS (${color2}root${color3})"
echo -e "${color1}16${color3}.$bd Domain Section (${color2}menu-domain${color3})"
echo -e""
echo -e "${color1}x${color3}.$bd Menu"
echo -e""
read -p "  Please Enter The Number  [1-17 or x] :  "  sis
echo -e ""
case $sis in
1)
changeport
;;
2)
wbmn
;;
3)
limitspeed
;;
4)
ram
;;
5)
reboot
;;
6)
speedtest -s 7556
;;
7)
info
;;
8)
about
;;
9)
clearlog
;;
10)
autoreboot
;;
11)
status
;;
12)
bw
;;
13)
bbr
;;
14)
nano /etc/issue.net
;;
15)
wget https://raw.githubusercontent.com/Sangarya/root/main/root.sh && chmod +x root.sh && ./root.sh
;;
16)
menu-domain
;;
x)
menu
;;
*)
echo "Masukkan Nomor Yang Ada Sayang!"
sleep 1
menu-tools
;;
esac

