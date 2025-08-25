#!/bin/bash

# a. Create a zip archive named xfusioncorp_news.zip of /var/www/html/news directory. 
# b. Save the archive in /backup/ on App Server 2. This is a temporary storage, 
# as backups from this location will be clean on weekly basis. 
# Therefore, we also need to save this backup archive on Nautilus Backup Server. 
# c. Copy the created archive to Nautilus Backup Server server in /backup/ location. 
# d. Please make sure script won't ask for password while copying the archive file. 
# Additionally, the respective server user (for example, tony in case of App Server 1) must be able to run it.

sudo yum install zip -y 

ssh-keygen -t rsa

# Copy public key to Nautilus Backup Server (as backup user, probably backup):
# this command copy's the exact key by indicating the right key if therea re many keys generated
ssh-copy-id -i ~/.ssh/id_rsa.pub backup@nautilus-backup

cat << EOF>> /scripts/news_backup.sh
#!/bin/bash

# Variables
SRC_DIR="/var/www/html/news"
BACKUP_DIR="/backup"
BACKUP_FILE="xfusioncorp_news.zip"
BACKUP_SERVER="stbkp01"
USER="clint"

# Ensure zip is installed
if ! command -v zip &> /dev/null; then
    echo "zip not found, installing..."
    sudo yum install -y zip  >/dev/null 2>&1
fi

# Create backup directory if not exists
mkdir -p $BACKUP_DIR

# Create the zip archive
zip -r $BACKUP_DIR/$BACKUP_FILE $SRC_DIR >/dev/null 2>&1

if [ $? -ne 0 ]; then
    echo "Failed to create archive!"
    exit 1
fi

# Copy to Backup Server
scp $BACKUP_DIR/$BACKUP_FILE $USER@$BACKUP_SERVER:/backup/

if [ $? -eq 0 ]; then
    echo "Backup successful!"
else
    echo "Backup failed!"
    exit 1
fi

EOF


sudo mkdir -p /scripts
sudo mv news_backup.sh /scripts/
sudo chmod +x /scripts/news_backup.sh

/scripts/news_backup.sh


