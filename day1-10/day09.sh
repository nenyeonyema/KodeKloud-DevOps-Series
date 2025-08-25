#!/bin/bash

#The production support team identified that the application is unable to connect to the database. 
# After digging into the issue, the team found that mariadb service is down on the database server. 
# Look into the issue and fix the same

ssh peter@stdb01   # usually DB server username is peter

sudo systemctl status mariadb

sudo chown -R mysql:mysql /var/lib/mysql
sudo chmod 750 /var/lib/mysql

sudo systemctl start mariadb

sudo systemctl enable mariadb
sudo systemctl status mariadb

ss -tulnp |grep 3306
# Test connection
sudo mysql -u root

# if it still fails to start, run
journalctl -xeu mariadb.service
