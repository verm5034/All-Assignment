#!/bin/bash

cd ~
cd /home/ec2-user/wpinstall/
cp  /var/www/html/wordpress/wp-config.php wp-config.php
cp /var/log/httpd/access_log access_log
