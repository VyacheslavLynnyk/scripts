#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
sudo cp -f -r $DIR/configs/*.conf /opt/lampp/etc/extra/
echo configs copied...
cd /opt/lampp/etc/
sed "s/#Include etc\/extra\/httpd-vhosts.conf/Include etc\/extra\/httpd-vhosts.conf/" httpd.conf | sudo tee httpd.conf
echo "---Look down---
127.0.0.1	study
127.0.0.1	trash
127.0.0.1 	site
127.0.0.1	dev
127.0.0.1       php-academy.my
127.0.0.1	help
" 
read -p "Do you want to add this to your /etc/hosts? (y/n)" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "127.0.0.1	study
127.0.0.1	trash
127.0.0.1 	site
127.0.0.1	dev
127.0.0.1       php-academy.my
127.0.0.1	help" | sudo tee -a /etc/hosts
fi
$DIR/1xamp-reload.sh
$DIR/2hosts-config.sh
