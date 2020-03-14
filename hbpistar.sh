#!/bin/bash

chmod a+w /usr/local/sbin/HostFilesUpdate.sh
sed -i '100i wget http://hblinkspain.duckdns.org/DMR_Hosts.txt -O /root/DMR_Hosts.txt' /usr/local/sbin/HostFilesUpdate.sh
chmod a+w /usr/local/sbin/pistar-firewall
sed -i '84i iptables -A OUTPUT -p udp --dport 62501:62530 -j ACCEPT' /usr/local/sbin/pistar-firewall
sed -i '85i iptables -t mangle -A POSTROUTING -p udp --dport 62501:62530 -j DSCP --set-dscp 46' /usr/local/sbin/pistar-firewall
/usr/local/sbin/pistar-firewall
/usr/local/sbin/HostFilesUpdate.sh
rpi-ro
