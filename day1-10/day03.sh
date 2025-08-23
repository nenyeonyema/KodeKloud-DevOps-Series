#!bin/bash

# Disable direct SSH root login on all app servers

ssh user1@stapp01
ssh user2@stapp02
ssh user3@stapp03

# On each server
sudo vi /etc/ssh/sshd_config

# change permission value from 'yes' to 'no' and if commented, uncomment it
PermitRootLogin no

# Restart the ssh server and also enable restart on reboot
sudo systemctl restart sshd
# sudo systemctl status sshd

# checks if root has access permission, likely returns 'permission denied'
ssh root@stapp01


