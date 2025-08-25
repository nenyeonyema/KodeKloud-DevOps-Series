#!/bin/bash

# Install ansible version 4.10.0 on Jump host using pip3 only. 
# Make sure Ansible binary is available globally on this system, 
#i.e all users on this system are able to run Ansible commands.

sudo yum update -y  

sudo yum install python3-pip -y  

sudo pip3 install ansible==4.10.0

# verify installation
ansible --version

# Step 5 (Optional but Recommended): Symlink Ansible to /usr/bin/

# Sometimes pip3 places binaries in /usr/local/bin, which might not be in $PATH for all users. To ensure global access:

sudo ln -s /usr/local/bin/ansible /usr/bin/ansible
sudo ln -s /usr/local/bin/ansible-playbook /usr/bin/ansible-playbook
