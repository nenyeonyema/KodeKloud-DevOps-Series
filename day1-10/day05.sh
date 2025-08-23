#!/bin/bash

# Install the required SELinux packages. Permanently disable SELinux for the time being; 
# it will be re-enabled after necessary configuration changes. 
# No need to reboot the server, as a scheduled maintenance reboot is already planned for tonight.

sudo yum install -y selinux-policy selinux-policy-targeted policycoreutils

sudo vi /etc/selinux/config

# Look for the line below and change the value from 'enable' to 'disable'

SELINUX=disabled

grep SELINUX= /etc/selinux/config
