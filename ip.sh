#!/usr/bin/expect -f

spawn telnet 192.168.1.1
expect "BusyBox on (none) login:"
send "root\n"
expect "Password:"
send "a\n"
expect "#"
send "ifconfig ppp0 | grep 'inet'\n"
#send "cat /proc/avalanche/avsar_modem_stats\n"
expect "#"
send "exit/n"





