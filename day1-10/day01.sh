!# bin/bash

# Task 1: Non Interactive shell
# Create a user named anita with a non-interactive shell on App Server 1.

sudo useradd -s /sbin/nologin anita

getent passwd anita
