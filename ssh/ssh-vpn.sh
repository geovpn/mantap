#!/bin/bash
# By geovpn
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
# ==================================================
# Link Hosting Kalian
geovpn="raw.githubusercontent.com/geovpn/mantap/main/ssh"

# Link Hosting Kalian Untuk Xray
geovpnn="raw.githubusercontent.com/geovpn/mantap/main/xray"

# Link Hosting Kalian Untuk Trojan Go
geovpnnn="raw.githubusercontent.com/geovpn/mantap/main/trojango"

# Link Hosting Kalian Untuk Stunnel5
#geovpnnnn="raw.githubusercontent.com/geovpn/mantap/main/stunnel5"

# Link Hosting Kalian Untuk menu
geovpnnnnn="raw.githubusercontent.com/geovpn/mantap/main/menu"

# Link Hosting Kalian Untuk banner
geovpnnnnnn="raw.githubusercontent.com/geovpn/mantap/main/banner"

# Link Hosting Kalian Untuk dom
geovpnnnnnnn="raw.githubusercontent.com/geovpn/mantap/main/dom"

# Link Hosting Kalian Untuk trial
geovpnnnnnnnn="raw.githubusercontent.com/geovpn/mantap/main/trial"

# initializing var
export DEBIAN_FRONTEND=noninteractive
MYIP=$(wget -qO- ipinfo.io/ip);
MYIP2="s/xxxxxxxxx/$MYIP/g";
NET=$(ip -o $ANU -4 route show to default | awk '{print $5}');
source /etc/os-release
ver=$VERSION_ID

#detail nama perusahaan
country=ID
state=Indonesia
locality=Indonesia
organization=www.geogabut.com
organizationalunit=www.geogabut.com
commonname=www.geogabut.com
email=paoandest@gmail.com

# simple password minimal
wget -O /etc/pam.d/common-password "https://${geovpn}/password"
chmod +x /etc/pam.d/common-password

# go to root
cd
# Edit file /etc/systemd/system/rc-local.service
cat > /etc/systemd/system/rc-local.service <<-END
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local
[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99
[Install]
WantedBy=multi-user.target
END

# nano /etc/rc.local
cat > /etc/rc.local <<-END
#!/bin/sh -e
# rc.local
# By default this script does nothing.
exit 0
END

# Ubah izin akses
chmod +x /etc/rc.local

# enable rc local
systemctl enable rc-local
systemctl start rc-local.service

# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

#update
apt update -y
apt upgrade -y
apt dist-upgrade -y
apt-get remove --purge ufw firewalld -y
apt-get remove --purge exim4 -y

# install wget and curl
apt -y install wget curl

#figlet
apt-get install figlet -y
apt-get install ruby -y
gem install lolcat

# set time GMT +7
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# set locale
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config

# install
apt-get --reinstall --fix-missing install -y bzip2 gzip coreutils wget screen rsyslog iftop htop net-tools zip unzip wget net-tools curl nano sed screen gnupg gnupg1 bc apt-transport-https build-essential dirmngr libxml-parser-perl neofetch git lsof
echo "clear" >> .profile
echo "figlet -f slant GEO GABUT | lolcat" >> .profile
echo "sleep 0.5" >> .profile
echo "clear" >> .profile
echo "running" >> .profile
echo "echo -e \" - Script Mod By Geo Gabut\" | lolcat" >> .profile
echo "echo -e \"\x1b[96m - Silahkan Ketik\x1b[m \x1b[92mMENU\x1b[m \x1b[96mUntuk Melihat daftar Perintah\x1b[m\"" >> .profile

# Install SSLH
apt -y install sslh -y

#SSLH
apt-get install sslh -y
#Forward 443 = ws-ssl-stunnel4-dropbear
wget -O /etc/default/sslh "https://${geovpn}/sslh.conf"
service sslh restart

# install webserver
apt -y install nginx php php-fpm php-cli php-mysql libxml-parser-perl
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
curl https://${geovpn}/nginx.conf > /etc/nginx/nginx.conf
curl https://${geovpn}/vps.conf > /etc/nginx/conf.d/vps.conf
sed -i 's/listen = \/var\/run\/php-fpm.sock/listen = 127.0.0.1:9000/g' /etc/php/fpm/pool.d/www.conf
useradd -m vps;
mkdir -p /home/vps/public_html
echo "<?php phpinfo() ?>" > /home/vps/public_html/info.php
chown -R www-data:www-data /home/vps/public_html
chmod -R g+rw /home/vps/public_html
cd /home/vps/public_html
wget -O /home/vps/public_html/index.html "https://${geovpn}/index.html1"
/etc/init.d/nginx restart
cd

# install badvpn
cd
wget -O /usr/bin/badvpn-udpgw "https://${geovpn}/badvpn-udpgw64"
chmod +x /usr/bin/badvpn-udpgw
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500' /etc/rc.local
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500

# setting port ssh
sed -i 's/Port 22/Port 22/g' /etc/ssh/sshd_config

# install dropbear
apt -y install dropbear
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=143/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 109 -p 69 -p 77"/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
/etc/init.d/dropbear restart

# install squid
cd
apt -y install squid3
wget -O /etc/squid/squid.conf "https://${geovpn}/squid3.conf"
sed -i $MYIP2 /etc/squid/squid.conf

# setting vnstat
apt -y install vnstat
/etc/init.d/vnstat restart
apt -y install libsqlite3-dev
wget https://humdi.net/vnstat/vnstat-2.6.tar.gz
tar zxvf vnstat-2.6.tar.gz
cd vnstat-2.6
./configure --prefix=/usr --sysconfdir=/etc && make && make install
cd
vnstat -u -i $NET
sed -i 's/Interface "'""eth0""'"/Interface "'""$NET""'"/g' /etc/vnstat.conf
chown vnstat:vnstat /var/lib/vnstat -R
systemctl enable vnstat
/etc/init.d/vnstat restart
rm -f /root/vnstat-2.6.tar.gz
rm -rf /root/vnstat-2.6

# install stunnel
apt install stunnel4 -y
cat > /etc/stunnel/stunnel.conf <<-END
cert = /etc/stunnel/stunnel.pem
client = no
socket = a:SO_REUSEADDR=1
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1

[dropbear]
accept = 222
connect = 127.0.0.1:109

[openssh]
accept = 171
connect = 127.0.0.1:22

[ws-stunnel]
accept = 2096
connect = 127.0.0.1:443

[dropbear]
accept = 777
connect = 127.0.0.1:109

[openvpn]
accept = 990
connect = 127.0.0.1:1194

END

# certificate
openssl genrsa -out key.pem 2048
openssl req -new -x509 -key key.pem -out cert.pem -days 1095 \
-subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"
cat key.pem cert.pem >> /etc/stunnel/stunnel.pem

# konfigurasi stunnel
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
/etc/init.d/stunnel4 restart

#OpenVPN
wget https://${geovpn}/vpn.sh &&  chmod +x vpn.sh && ./vpn.sh

# Install BBR
wget https://${geovpn}/bbr.sh && chmod +x bbr.sh && ./bbr.sh

# Ganti Banner
wget -O /etc/issue.net "https://${geovpn}/issue.net"

# install fail2ban
apt -y install fail2ban

# Instal DDOS Flate
if [ -d '/usr/local/ddos' ]; then
	echo; echo; echo "Tolong  Uninstall Versi Sebelumnya!"
	exit 0
else
	mkdir /usr/local/ddos
fi
clear
echo; echo 'Installing DOS-Deflate 0.6'; echo
echo; echo -n 'Downloading source files...'
wget -q -O /usr/local/ddos/ddos.conf http://www.inetbase.com/scripts/ddos/ddos.conf
echo -n '.'
wget -q -O /usr/local/ddos/LICENSE http://www.inetbase.com/scripts/ddos/LICENSE
echo -n '.'
wget -q -O /usr/local/ddos/ignore.ip.list http://www.inetbase.com/scripts/ddos/ignore.ip.list
echo -n '.'
wget -q -O /usr/local/ddos/ddos.sh http://www.inetbase.com/scripts/ddos/ddos.sh
chmod 0755 /usr/local/ddos/ddos.sh
cp -s /usr/local/ddos/ddos.sh /usr/local/sbin/ddos
echo '...done'
echo; echo -n 'Creating cron to run script every minute.....(Default setting)'
/usr/local/ddos/ddos.sh --cron > /dev/null 2>&1
echo '.....done'
echo; echo 'Installation has completed.'
echo 'Config file is at /usr/local/ddos/ddos.conf'
echo 'Please send in your comments and/or suggestions to zaf@vsnl.com'

# banner /etc/issue.net
wget -O /etc/issue.net "https://raw.githubusercontent.com/Sangarya/premium/main/file/banner.conf"
echo "Banner /etc/issue.net" >>/etc/ssh/sshd_config
sed -i 's@DROPBEAR_BANNER=""@DROPBEAR_BANNER="/etc/issue.net"@g' /etc/default/dropbear

# blockir torrent
iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP
iptables -A FORWARD -m string --string "announce_peer" --algo bm -j DROP
iptables -A FORWARD -m string --string "find_node" --algo bm -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -A FORWARD -m string --algo bm --string "peer_id=" -j DROP
iptables -A FORWARD -m string --algo bm --string ".torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -A FORWARD -m string --algo bm --string "torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce" -j DROP
iptables -A FORWARD -m string --algo bm --string "info_hash" -j DROP
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload

# download script
cd /usr/bin
wget -O addhost "https://${geovpn}/addhost.sh"
wget -O autoreboot "https://${geovpn}/autoreboot.sh"
wget -O about "https://${geovpn}/about.sh"
wget -O menu "https://${geovpn}/menu.sh"
wget -O addssh "https://${geovpn}/addssh.sh"
wget -O trialssh "https://${geovpn}/trialssh.sh"
wget -O delssh "https://${geovpn}/delssh.sh"
wget -O member "https://${geovpn}/member.sh"
wget -O delexp "https://${geovpn}/delexp.sh"
wget -O cekssh "https://${geovpn}/cekssh.sh"
wget -O restart "https://${geovpn}/restart.sh"
wget -O speedtest "https://${geovpn}/speedtest_cli.py"
wget -O info "https://${geovpn}/info.sh"
wget -O ram "https://${geovpn}/ram.sh"
wget -O renewssh "https://${geovpn}/renewssh.sh"
wget -O autokill "https://${geovpn}/autokill.sh"
wget -O ceklim "https://${geovpn}/ceklim.sh"
wget -O tendang "https://${geovpn}/tendang.sh"
wget -O clearlog "https://${geovpn}/clearlog.sh"
wget -O changeport "https://${geovpn}/changeport.sh"
wget -O portovpn "https://${geovpn}/portovpn.sh"
wget -O portwg "https://${geovpn}/portwg.sh"
wget -O porttrojan "https://${geovpn}/porttrojan.sh"
wget -O portsstp "https://${geovpn}/portsstp.sh"
wget -O portsquid "https://${geovpn}/portsquid.sh"
wget -O portv2ray "https://${geovpn}/portv2ray.sh"
wget -O portvless "https://${geovpn}/portvless.sh"
wget -O wbmn "https://${geovpn}/webmin.sh"
wget -O xp "https://${geovpn}/xp.sh"
wget -O swapkvm "https://${geovpn}/swapkvm.sh"
wget -O addv2ray "https://${geovpnn}/addv2ray.sh"
wget -O trialv2ray "https://${geovpnn}/trialv2ray.sh"
wget -O addvless "https://${geovpnn}/addvless.sh"
wget -O addtrojan "https://${geovpnn}/addtrojan.sh"
wget -O delv2ray "https://${geovpnn}/delv2ray.sh"
wget -O delvless "https://${geovpnn}/delvless.sh"
wget -O deltrojan "https://${geovpnn}/deltrojan.sh"
wget -O cekv2ray "https://${geovpnn}/cekv2ray.sh"
wget -O cekvless "https://${geovpnn}/cekvless.sh"
wget -O cektrojan "https://${geovpnn}/cektrojan.sh"
wget -O renewv2ray "https://${geovpnn}/renewv2ray.sh"
wget -O renewvless "https://${geovpnn}/renewvless.sh"
wget -O renewtrojan "https://${geovpnn}/renewtrojan.sh"
wget -O certv2ray "https://${geovpnn}/certv2ray.sh"
wget -O addtrgo "https://${geovpnnn}/addtrgo.sh"
wget -O deltrgo "https://${geovpnnn}/deltrgo.sh"
wget -O renewtrgo "https://${geovpnnn}/renewtrgo.sh"
wget -O cektrgo "https://${geovpnnn}/cektrgo.sh"
wget -O menu-backup "https://${geovpnnnnn}/menu-backup.sh"
wget -O menu-domain "https://${geovpnnnnn}/menu-domain.sh"
wget -O menu-l2tp "https://${geovpnnnnn}/menu-l2tp.sh"
wget -O menu "https://${geovpnnnnn}/menu.sh"
wget -O menu-pptp "https://${geovpnnnnn}/menu-pptp.sh"
wget -O menu-shadowsocks "https://${geovpnnnnn}/menu-shadowsocks.sh"
wget -O menu-ssh "https://${geovpnnnnn}/menu-ssh.sh"
wget -O menu-sstp "https://${geovpnnnnn}/menu-sstp.sh"
wget -O menu-tools "https://${geovpnnnnn}/menu-tools.sh"
wget -O menu-trial "https://${geovpnnnnn}/menu-trial.sh"
wget -O menu-trojan "https://${geovpnnnnn}/menu-trojan.sh"
wget -O menu-v2ray "https://${geovpnnnnn}/menu-v2ray.sh"
wget -O menu-vpn "https://${geovpnnnnn}/menu-vpn.sh"
wget -O menu-wireguard "https://${geovpnnnnn}/menu-wireguard.sh"
wget -O bbr "https://${geovpn}/bbr.sh"
wget -O status "https://${geovpnnnnn}/status.sh"
wget -O running "https://${geovpnnnnn}/running.sh"
wget -O bannerku "https://${geovpnnnnn}/bannerku"
wget -O bannerDOMAIN "https://${geovpnnnnnn}/bannerDOMAIN"
wget -O bannerTRIAL "https://${geovpnnnnnn}/bannerTRIAL"
wget -O bannerL2TP "https://${geovpnnnnnn}/bannerL2TP"
wget -O bannerPPTP "https://${geovpnnnnnn}/bannerPPTP"
wget -O bannerSHADOWSOCK "https://${geovpnnnnnn}/bannerSHADOWSOCK"
wget -O bannerSSH "https://${geovpnnnnnn}/bannerSSH"
wget -O bannerSSTP "https://${geovpnnnnnn}/bannerSSTP"
wget -O bannerSYSTEM "https://${geovpnnnnnn}/bannerSYSTEM"
wget -O bannerTROJAN "https://${geovpnnnnnn}/bannerTROJAN"
wget -O bannerV2RAY "https://${geovpnnnnnn}/bannerV2RAY"
wget -O bannerVPN "https://${geovpnnnnnn}/bannerVPN"
wget -O bannerWIREGUARD "https://${geovpnnnnnn}/bannerWIREGUARD"
wget -O bannerBACKUP "https://${geovpnnnnnn}/bannerBACKUP"
wget -O addcf "https://${geovpnnnnnnn}/addcf.sh"
wget -O cfd "https://${geovpnnnnnnn}/cfd.sh"
wget -O cff "https://${geovpnnnnnnn}/cff.sh"
wget -O cfh "https://${geovpnnnnnnn}/cfh.sh"
wget -O domen "https://${geovpnnnnnnn}/domen.sh"
wget -O pointing "https://${geovpnnnnnnn}/pointing.sh"
wget -O bw "https://${geovpnnnnnnn}/bw.sh"
wget -O update "https://${geovpnnnnnnn}/update.sh"
wget -O domen "https://${geovpnnnnnnn}/domen.sh"
#wget -O trial-akun "https://${geovpnnnnnnnn}/trial-akun.sh"
wget -O triall2tp "https://${geovpnnnnnnnn}/triall2tp.sh"
wget -O trialpptp "https://${geovpnnnnnnnn}/trialpptp.sh"
wget -O trialss "https://${geovpnnnnnnnn}/trialss.sh"
wget -O trialssh "https://${geovpnnnnnnnn}/trialssh.sh"
wget -O trialssr "https://${geovpnnnnnnnn}/trialssr.sh"
wget -O trialsstp "https://${geovpnnnnnnnn}/trialsstp.sh"
wget -O trialtrojan "https://${geovpnnnnnnnn}/trialtrojan.sh"
wget -O trialv2ray "https://${geovpnnnnnnnn}/trialv2ray.sh"
wget -O /usr/bin/trialv2ray https://${geovpnnnnnnnn}/trialv2ray.sh && chmod +x /usr/bin/trialv2ray && cd /usr/bin && apt install -y dos2unix && dos2unix trialv2ray
wget -O trialvless "https://${geovpnnnnnnnn}/trialvless.sh"
wget -O trialwg "https://${geovpnnnnnnnn}/trialwg.sh"
wget -O trialtrgo "https://${geovpnnnnnnnn}/trialtrgo.sh"
chmod +x menu-backup
chmod +x menu-domain
chmod +x menu-l2tp
chmod +x menu
chmod +x menu-pptp
chmod +x menu-shadowsocks
chmod +x menu-ssh
chmod +x menu-sstp
chmod +x menu-tools
chmod +x menu-trial
chmod +x menu-trojan
chmod +x menu-v2ray
chmod +x menu-vpn
chmod +x menu-wireguard
chmod +x bbr
chmod +x status
chmod +x running
chmod +x trialtrgo
chmod +x trial-akun
chmod +x trialpptp
chmod +x trialss
chmod +x trialssh
chmod +x trialssr
chmod +x trialsstp
chmod +x trialtrojan
chmod +x triall2tp
chmod +x trialv2ray
chmod +x trialvless
chmod +x trialwg
chmod +x autoreboot
chmod +x addhost
chmod +x menu
chmod +x addssh
chmod +x trialssh
chmod +x delssh
chmod +x member
chmod +x delexp
chmod +x cekssh
chmod +x restart
chmod +x speedtest
chmod +x info
chmod +x about
chmod +x autokill
chmod +x tendang
chmod +x ceklim
chmod +x ram
chmod +x renewssh
chmod +x clearlog
chmod +x changeport
chmod +x portovpn
chmod +x portwg
chmod +x porttrojan
chmod +x portsstp
chmod +x portsquid
chmod +x portv2ray
chmod +x portvless
chmod +x wbmn
chmod +x xp
chmod +x swapkvm
chmod +x addv2ray
chmod +x addvless
chmod +x addtrojan
chmod +x delv2ray
chmod +x delvless
chmod +x deltrojan
chmod +x cekv2ray
chmod +x cekvless
chmod +x cektrojan
chmod +x renewv2ray
chmod +x renewvless
chmod +x renewtrojan
chmod +x certv2ray
chmod +x addtrgo
chmod +x deltrgo
chmod +x renewtrgo
chmod +x cektrgo
chmod +x update
chmod +x bannerku
chmod +x bannerDOMAIN
chmod +x bannerL2TP
chmod +x bannerPPTP
chmod +x bannerSHADOWSOCK
chmod +x bannerSSH
chmod +x bannerSSTP
chmod +x bannerSYSTEM
chmod +x bannerTROJAN
chmod +x bannerV2RAY
chmod +x bannerVPN
chmod +x bannerWIREGUARD
chmod +x bannerTRIAL
chmod +x addcf
chmod +x cfd
chmod +x cff
chmod +x cfh
chmod +x domen
chmod +x pointing
chmod +x bw
echo "0 5 * * * root clearlog && reboot" >> /etc/crontab
echo "0 0 * * * root xp" >> /etc/crontab
# remove unnecessary files
cd
apt autoclean -y
apt -y remove --purge unscd
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove bind9*;
apt-get -y remove sendmail*
apt autoremove -y
# finishing
cd
chown -R www-data:www-data /home/vps/public_html
/etc/init.d/nginx restart
/etc/init.d/openvpn restart
/etc/init.d/cron restart
/etc/init.d/ssh restart
/etc/init.d/dropbear restart
/etc/init.d/fail2ban restart
/etc/init.d/sslh restart
/etc/init.d/stunnel4 restart
/etc/init.d/vnstat restart
/etc/init.d/fail2ban restart
/etc/init.d/squid restart
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500
history -c
echo "unset HISTFILE" >> /etc/profile

cd
rm -f /root/key.pem
rm -f /root/cert.pem
rm -f /root/ssh-vpn.sh

# finihsing
clear
