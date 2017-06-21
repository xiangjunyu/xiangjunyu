#!/bin/bash
PID=`ps -ef|grep "keepalived -D -f" | grep -v grep | head -n1 | awk '{print $2}'`
kill -TERM $PID
route del -host 192.168.1.251 dev em2
sleep 5