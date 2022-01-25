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
# ==========================================
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
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
echo -e ""
echo -e "Starting Restart All Service" | lolcat
sleep 2
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting shadowsocks-libev-server@tls "
systemctl restart shadowsocks-libev-server@tls
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting shadowsocks-libev-server@http "
systemctl restart shadowsocks-libev-server@http
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting ssrmu "
/etc/init.d/ssrmu restart
echo -e "[ ${green}ok${NC} ] Restarting ssh "
/etc/init.d/ssh restart
echo -e "[ ${green}ok${NC} ] Restarting dropbear "
/etc/init.d/dropbear restart
echo -e "[ ${green}ok${NC} ] Restarting sslh "
/etc/init.d/sslh restart
echo -e "[ ${green}ok${NC} ] Restarting stunnel4 "
/etc/init.d/stunnel4 restart
echo -e "[ ${green}ok${NC} ] Restarting openvpn "
/etc/init.d/openvpn restart
echo -e "[ ${green}ok${NC} ] Restarting fail2ban "
/etc/init.d/fail2ban restart
echo -e "[ ${green}ok${NC} ] Restarting cron "
/etc/init.d/cron restart
echo -e "[ ${green}ok${NC} ] Restarting nginx "
/etc/init.d/nginx restart
echo -e "[ ${green}ok${NC} ] Restarting squid "
/etc/init.d/squid restart
echo -e "[ ${green}ok${NC} ] Restarting xl2tpd "
/etc/init.d/xl2tpd restart
echo -e "[ ${green}ok${NC} ] Restarting pptpd "
/etc/init.d/pptpd restart
echo -e "[ ${green}ok${NC} ] Restarting accel-ppp "
/etc/init.d/accel-ppp restart
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting ssrmu "
systemctl restart ssrmu
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting ws-dropbear.service "
systemctl restart ws-dropbear.service
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting ws-openssh.service "
systemctl restart ws-openssh.service
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting ws-openvpn.service "
systemctl restart ws-openvpn.service
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting ws-stunnel.service "
systemctl restart ws-stunnel.service
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting xray@v2ray-tls "
systemctl restart xray@v2ray-tls
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting xray@v2ray-nontls "
systemctl restart xray@v2ray-nontls
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting xray@vless-tls "
systemctl restart xray@vless-tls
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting xray@vless-nontls "
systemctl restart xray@vless-nontls
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting xray@trojan "
systemctl restart xray@trojan
echo -e "[ ${green}ok${NC} ] Restarting shadowsocks-libev "
/etc/init.d/shadowsocks-libev restart
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting shadowsocks-libev "
systemctl restart shadowsocks-libev
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting xl2tpd "
systemctl restart xl2tpd
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting pptpd "
systemctl restart pptpd
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting ipsec "
systemctl restart ipsec
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting accel-ppp "
systemctl restart accel-ppp
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting ws-openvpn "
systemctl restart ws-openvpn
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting wg-quick@wg0 "
systemctl restart wg-quick@wg0
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting ssh-ohp "
systemctl restart ssh-ohp
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting dropbear-ohp "
systemctl restart dropbear-ohp
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting openvpn-ohp "
systemctl restart openvpn-ohp
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting trojan-go "
systemctl restart trojan-go
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 1000
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 1000
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 1000
clear
echo -e "Restart All Service" | lolcat
sleep 2
figlet -f slant SUKSES | lolcat
running
