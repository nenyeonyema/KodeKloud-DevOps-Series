#!/bin/bash

# Set up a password-less authentication from user thor on jump host 
# to all app servers through their respective sudo users.

ssh-keygen -t rsa -b 4096

# Copy the public key to each App Server user

# For App Server 1 (as tony):

ssh-copy-id tony@app_server1


# For App Server 2 (as steve):

ssh-copy-id steve@app_server2

# if ssh-copy-id is not available, add the keys mannually

cat ~/.ssh/id_rsa.pub | ssh tony@app_server1 "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys"

# Verify passwordless ssh 
ssh tony@app_server1
ssh steve@app_server2

# If successful, it should log in without asking password.