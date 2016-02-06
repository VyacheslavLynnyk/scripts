#!/bin/bash
myip=`/sbin/ifconfig | grep "inet addr:".[1,3-9]. | cut -d: -f2 | awk '{ print $1}'`
cd /opt/lampp/etc/extra/
sed "s/$myip/*/" vhost-phpacademy.conf | sudo tee vhost-phpacademy.conf
cd /etc/
sed "s/$myip       php-academy.my/127.0.0.1       php-academy.my/" hosts | sudo tee hosts

sudo /opt/lampp/xampp reload
echo "My ip: $myip - works offline..."



