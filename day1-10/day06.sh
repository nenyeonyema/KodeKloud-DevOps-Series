#!/bin/bash

# Task 6: Cron Job
# a. Install cronie package on all Nautilus app servers and start crond service. 
# b. Add a cron */5 * * * * echo hello > /tmp/cron_text for root user."

sudo yum install -y cronie 

# Start and enable crond/cron service
sudo systemctl start crond 
sudo systemctl enable crond

# Open root’s crontab:
sudo crontab -e

# Add the following line:

*/5 * * * * echo hello > /tmp/cron_text
# This will run every 5 minutes, writing hello into /tmp/cron_text.

# After waiting 5 minutes:

cat /tmp/cron_text


# If successful, you’ll see:

# hello