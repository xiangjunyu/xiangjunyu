#!/bin/bash
#Creat By  xiangjunyu
#version 20170621-1.0
#检测后端服务器存活,这里特意注册了1个域名用户检测DNS服务，毕竟只是检测udp 53端口是否存活还是不够的，要检测DNS服务是否正常才是王道
if [ $port == 53 ];then
    nslookup checkdns.test.com ${rip}|grep mail.test.com
else
#其他的则使用nc来检测TCP端口是否存活,keepalived已经自带TCP检测，可以不用
    nc -z $rip ${port}
fi
if [ $? -eq 0 ]; then
    exit 0    #返回值给keepalived，返回值为0时，keepalived会知道后端检测正常，继续讲对应的DNS IP保留在RS列表中
else
    exit 1    #返回值给keepalived，返回值为1时，keeplived会知道后端检测失败，直接将后端的故障DNS从RS列表中摘除，保证业务正常
fi