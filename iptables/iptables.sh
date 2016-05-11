#!/bin/bash

EXTIF="eth0" # 连接公网的网络接口
INIF="eth1" # 连接局域网的网络接口
INNET="192.168.100.0/24"
export EXTIF INIF INNET

echo "1" > /proc/sys/net/ipv4/tcp_syncookies
echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
for i in /proc/sys/net/ipv4/conf/*/{rp_filter,log_martians}; do
    echo "1" > $i
done
# for i in /proc/sys/net/ipv4/conf/*/{accept_source_route,accept_redirects, send_redirects}; do
# 	echo "0" > $i
# done

iptables -F
iptables -X
iptables -Z
iptables -P INPUT   DROP
iptables -P OUTPUT  ACCEPT
iptables -P FORWARD ACCEPT
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

if [ -f ./iptables.deny ]; then
    sh ./iptables.deny
fi
if [ -f ./iptables.allow ]; then
    sh ./iptables.allow
fi
if [ -f ./iptables.http ]; then
    sh ./iptables.http
fi

AICMP="0 3 4 11 12 14 16 18"
for tyicmp in $AICMP
do
	iptables -A INPUT -i $EXTIF -p icmp --icmp-type $tyicmp -j ACCEPT
done

# 本机所开放的服务
# iptables -A INPUT -p TCP -i $EXTIF --dport  21 --sport 1024:65534 -j ACCEPT # FTP
iptables -A INPUT -p TCP -i $EXTIF --dport  22 --sport 1024:65534 -j ACCEPT # SSH
# iptables -A INPUT -p TCP -i $EXTIF --dport  25 --sport 1024:65534 -j ACCEPT # SMTP
# iptables -A INPUT -p UDP -i $EXTIF --dport  53 --sport 1024:65534 -j ACCEPT # DNS
# iptables -A INPUT -p TCP -i $EXTIF --dport  53 --sport 1024:65534 -j ACCEPT # DNS
iptables -A INPUT -p TCP -i $EXTIF --dport  80 --sport 1024:65534 -j ACCEPT # WWW
# iptables -A INPUT -p TCP -i $EXTIF --dport 110 --sport 1024:65534 -j ACCEPT # POP3
# iptables -A INPUT -p TCP -i $EXTIF --dport 443 --sport 1024:65534 -j ACCEPT # HTTPS

/etc/init.d/iptables save
