#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
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
purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
# ==========================================
# Link Hosting Kalian Untuk Ssh Vpn
geovpn="raw.githubusercontent.com/geovpn/mantap/main/ssh"
# Link Hosting Kalian Untuk Sstp
geovpnn="raw.githubusercontent.com/geovpn/mantap/main/sstp"
# Link Hosting Kalian Untuk Ssr
geovpnnn="raw.githubusercontent.com/geovpn/mantap/main/ssr"
# Link Hosting Kalian Untuk Shadowsocks
geovpnnnn="raw.githubusercontent.com/geovpn/mantap/main/shadowsocks"
# Link Hosting Kalian Untuk Wireguard
geovpnnnnn="raw.githubusercontent.com/geovpn/mantap/main/wireguard"
# Link Hosting Kalian Untuk Xray
geovpnnnnnn="raw.githubusercontent.com/geovpn/mantap/main/xray"
# Link Hosting Kalian Untuk Ipsec
geovpnnnnnnn="raw.githubusercontent.com/geovpn/mantap/main/ipsec"
# Link Hosting Kalian Untuk Backup
geovpnnnnnnnn="raw.githubusercontent.com/geovpn/mantap/main/backup"
# Link Hosting Kalian Untuk Websocket
geovpnnnnnnnnn="raw.githubusercontent.com/geovpn/mantap/main/websocket"
# Link Hosting Kalian Untuk Ohp
geovpnnnnnnnnnn="raw.githubusercontent.com/geovpn/mantap/main/ohp"
###########
apt-get update --allow-releaseinfo-change -y > /dev/null

apt-get update -y > /dev/null 2>&1
apt-get upgrade -y > /dev/null 2>&1
#install figlet & lolcat
apt-get install figlet -y > /dev/null 2>&1
apt-get install ruby -y > /dev/null 2>&1
gem install lolcat > /dev/null 2>&1
clear
MYIP=$(wget -qO- https://icanhazip.com);
host=$(hostname);
cat > /etc/hosts <<-END
127.0.0.1       localhost.localdomain localhost
127.0.1.1       localhost
$MYIP   $host
END

apt-get install dbus -y > /dev/null
sudo hostnamectl set-hostname Setup-Geo-Project

clear
if [ -f "/etc/xray/domain" ]; then
echo "Script Already Installed"
exit 0
fi
mkdir /var/lib/geovpnstore;
echo "IP=" >> /var/lib/geovpnstore/ipvps.conf
curl -sS https://raw.githubusercontent.com/geovpn/perizinan/main/ascii-home
echo "Setting UP"
echo "Progress..."
sleep 3
echo -e "[ ${tyblue}PROSES${NC} ] Install Cloudflare.. "
sleep 4
wget https://${geovpn}/cf.sh && chmod +x cf.sh && ./cf.sh > /dev/null 2>&1
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
yellow "Cloudflare successfully installed..."
sleep 3
clear
curl -sS https://raw.githubusercontent.com/geovpn/perizinan/main/ascii-home
echo "Setting UP"
echo "Progress..."
sleep 3
echo -e "[ ${tyblue}PROSES${NC} ] Install SSH OVPN.. "
sleep 4
wget https://${geovpn}/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh > /dev/null 2>&1
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
yellow "SSH OVPN successfully installed..."
sleep 3
clear
curl -sS https://raw.githubusercontent.com/geovpn/perizinan/main/ascii-home
echo "Setting UP"
echo "Progress..."
sleep 3
echo -e "[ ${tyblue}PROSES${NC} ] Install SSTP.. "
sleep 4
wget https://${geovpnn}/sstp.sh && chmod +x sstp.sh && screen -S sstp ./sstp.sh > /dev/null 2>&1
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
yellow "SSTP successfully installed..."
sleep 3
clear
curl -sS https://raw.githubusercontent.com/geovpn/perizinan/main/ascii-home
echo "Setting UP"
echo "Progress..."
sleep 3
echo -e "[ ${tyblue}PROSES${NC} ] Install ShadowsocksR.. "
sleep 4
wget https://${geovpnnn}/ssr.sh && chmod +x ssr.sh && screen -S ssr ./ssr.sh > /dev/null 2>&1
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
yellow "ShadowsocksR successfully installed..."
sleep 3
clear
curl -sS https://raw.githubusercontent.com/geovpn/perizinan/main/ascii-home
echo "Setting UP"
echo "Progress..."
sleep 3
echo -e "[ ${tyblue}PROSES${NC} ] Install Shadowsocks.. "
sleep 4
wget https://${geovpnnnn}/sodosok.sh && chmod +x sodosok.sh && screen -S ss ./sodosok.sh > /dev/null 2>&1
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
yellow "Shadowsocks successfully installed..."
sleep 3
clear
curl -sS https://raw.githubusercontent.com/geovpn/perizinan/main/ascii-home
echo "Setting UP"
echo "Progress..."
sleep 3
echo -e "[ ${tyblue}PROSES${NC} ] Install Wireguard.. "
sleep 4
wget https://${geovpnnnnn}/wg.sh && chmod +x wg.sh && screen -S wg ./wg.sh > /dev/null 2>&1
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
yellow "Wireguard successfully installed..."
sleep 3
clear
curl -sS https://raw.githubusercontent.com/geovpn/perizinan/main/ascii-home
echo "Setting UP"
echo "Progress..."
sleep 3
echo -e "[ ${tyblue}PROSES${NC} ] Install Xray.. "
sleep 4
wget https://${geovpnnnnnn}/ins-xray.sh && chmod +x ins-xray.sh && screen -S xray ./ins-xray.sh > /dev/null 2>&1
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
yellow "Xray successfully installed..."
sleep 3
clear
curl -sS https://raw.githubusercontent.com/geovpn/perizinan/main/ascii-home
echo "Setting UP"
echo "Progress..."
sleep 3
echo -e "[ ${tyblue}PROSES${NC} ] Install L2TP vpn.. "
sleep 4
wget https://${geovpnnnnnnn}/ipsec.sh && chmod +x ipsec.sh && screen -S ipsec ./ipsec.sh > /dev/null 2>&1
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
yellow "L2TP successfully installed..."
sleep 3
clear
curl -sS https://raw.githubusercontent.com/geovpn/perizinan/main/ascii-home
echo "Setting UP"
echo "Progress..."
sleep 3
echo -e "[ ${tyblue}PROSES${NC} ] Install set-br.. "
sleep 4
wget https://${geovpnnnnnnnn}/set-br.sh && chmod +x set-br.sh && ./set-br.sh > /dev/null 2>&1
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
yellow "set-br successfully installed..."
sleep 3
clear
curl -sS https://raw.githubusercontent.com/geovpn/perizinan/main/ascii-home
echo "Setting UP"
echo "Progress..."
sleep 3
echo -e "[ ${tyblue}PROSES${NC} ] Install Websocket CDN.. "
sleep 4
wget https://${geovpnnnnnnnnn}/edu.sh && chmod +x edu.sh && ./edu.sh > /dev/null 2>&1
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
yellow "Websocket CDN successfully installed..."
sleep 3
clear
curl -sS https://raw.githubusercontent.com/geovpn/perizinan/main/ascii-home
echo "Setting UP"
echo "Progress..."
sleep 3
echo -e "[ ${tyblue}PROSES${NC} ] Install OHP.. "
sleep 4
wget https://${geovpnnnnnnnnnn}/ohp.sh && chmod +x ohp.sh && ./ohp.sh > /dev/null 2>&1
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
yellow "OHP successfully installed..."
sleep 3
clear
rm -f /root/ssh-vpn.sh
rm -f /root/sstp.sh
rm -f /root/wg.sh
rm -f /root/ss.sh
rm -f /root/ssr.sh
rm -f /root/ins-xray.sh
rm -f /root/ipsec.sh
rm -f /root/set-br.sh
rm -f /root/edu.sh
rm -f /root/ohp.sh
cat <<EOF> /etc/systemd/system/autosett.service
[Unit]
Description=autosetting
Documentation=https://t.me/sampiiiiu

[Service]
Type=oneshot
ExecStart=/bin/bash /etc/set.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable autosett
wget -O /etc/set.sh "https://${geovpn}/set.sh"
chmod +x /etc/set.sh
history -c
echo "2.9" > /home/ver
echo " "
echo "Installation has been completed!!"
echo " "
echo "=================-geovpn Project-==================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "---------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 443, 22"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 990"  | tee -a log-install.txt
echo "   - Stunnel4                : 443, 222, 777"  | tee -a log-install.txt
echo "   - Dropbear                : 443, 109, 143"  | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 89"  | tee -a log-install.txt
echo "   - Wireguard               : 7070"  | tee -a log-install.txt
echo "   - L2TP/IPSEC VPN          : 1701"  | tee -a log-install.txt
echo "   - PPTP VPN                : 1732"  | tee -a log-install.txt
echo "   - SSTP VPN                : 444"  | tee -a log-install.txt
echo "   - Shadowsocks-R           : 1443-1543"  | tee -a log-install.txt
echo "   - SS-OBFS TLS             : 2443-2543"  | tee -a log-install.txt
echo "   - SS-OBFS HTTP            : 3443-3543"  | tee -a log-install.txt
echo "   - XRAYS Vmess TLS         : 8443"  | tee -a log-install.txt
echo "   - XRAYS Vmess None TLS    : 80"  | tee -a log-install.txt
echo "   - XRAYS Vless TLS         : 2083"  | tee -a log-install.txt
echo "   - XRAYS Vless None TLS    : 8880"  | tee -a log-install.txt
echo "   - XRAYS Trojan            : 2087"  | tee -a log-install.txt
echo "   - Websocket SSL           : 443, 2096"  | tee -a log-install.txt
echo "   - Websocket Drop          : 2052, 2095"  | tee -a log-install.txt
echo "   - Websocket Ovpn          : 2086"  | tee -a log-install.txt
echo "   - OHP                     : 8181, 8282, 8383"  | tee -a log-install.txt
echo "   - Tr Go                   : 2053"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 05.00 GMT +7" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   - Dev/Main                : Amin Anak Nusa Tenggara Barat"  | tee -a log-install.txt
echo "   - Recode                  : Muhammad Amin" | tee -a log-install.txt
echo "   - Telegram                : T.me/sampiiiiu"  | tee -a log-install.txt
echo "   - Instagram               : @geo_gabuter"  | tee -a log-install.txt
echo "   - Whatsapp                : 082339191527"  | tee -a log-install.txt
echo "   - Facebook                : Muhammad Amin" | tee -a log-install.txt
echo "----------Script Created By geovpn Project------------" | tee -a log-install.txt
echo ""
echo " Reboot 5 Sec"
sleep 5
rm -f setup.sh
reboot
