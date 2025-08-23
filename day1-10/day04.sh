#!/bin/bash

# Grant executable permissions to the /tmp/xfusioncorp.sh script on App Server 3. 
# Additionally, ensure that all users have the capability to execute it

ssh user1@stapp03

ls -l /tmp/xfusioncorp.sh

sudo chmod a+x /tmp/xfusioncorp.sh

ls -l /tmp/xfusioncorp.sh

/tmp/xfusioncorp.sh
