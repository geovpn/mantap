#!/bin/bash
RED='\e[1;31m'
GREEN='\e[0;32m'
BLUE='\e[0;34m'
NC='\e[0m'

#Input Domain
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
echo ""
echo -e "${BLUE}==========================================================${NC}"
figlet Add Domain | lolcat
echo -e "${BLUE}==========================================================${NC}"
echo ""
echo "Please Input Your Pointing Domain In Cloudflare "
read -rp "Domain/Host: " -e host
echo "IP=$host" >> /var/lib/geovpnstore/ipvps.conf
#rm -f /home/homain
echo "$host" > /etc/xray/domain
echo -e "[${GREEN}Done${NC}]"

#Update Sertificate SSL
echo "Automatical Update Your Sertificate SSL"
sleep 3
echo Starting Update SSL Sertificate
sleep 0.5
source /var/lib/geovpnstore/ipvps.conf
domain=$IP
systemctl stop xray@v2ray-tls
systemctl stop xray@v2ray-nontls
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/v2ray.crt --keypath /etc/xray/v2ray.key --ecc
systemctl stop xray@v2ray-tls
systemctl stop xray@v2ray-nontls

#Done
echo -e "[${GREEN}Done${NC}]"
echo "Location Your Domain : /etc/xray/domain"
echo ""
echo -e "${BLUE}Script By GEO GABUT ANAK NTB${NC}"
