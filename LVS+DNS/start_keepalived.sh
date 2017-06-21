#!/bin/bash
/sbin/ipvsadm -C
/etc/keepalived/sbin/keepalived -D -f /etc/keepalived/etc/keepalived/keepalived.conf
route add -host 192.168.1.251 dev em2