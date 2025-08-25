#!bin/bash

# Task 2: User with expiry date
# Create a user named siva on App Server 2 in Stratos Datacenter. 
# Set the expiry date to 2024-03-28, ensuring the user is created in lowercase as per standard protocol.

sudo useradd -e 2025-08-21 siva

sudo passwd siva

sudo chage -l siva

# sudo userdel -r siva
