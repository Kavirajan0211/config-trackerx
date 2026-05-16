#!/bin/bash

PROJECT_DIR="$HOME/ConfigTrackerX"
BACKUP_DIR="$PROJECT_DIR/backups"
LOG_FILE="$PROJECT_DIR/logs/backup.log"

echo "Backup started at $(date)" >> "$LOG_FILE"

mkdir -p "$BACKUP_DIR"

if [ -f /etc/ssh/sshd_config ]; then
    cp /etc/ssh/sshd_config "$BACKUP_DIR/sshd_config"
    echo "sshd_config backed up" >> "$LOG_FILE"
else
    echo "sshd_config not found" >> "$LOG_FILE"
fi

if [ -f /etc/nginx/nginx.conf ]; then
    cp /etc/nginx/nginx.conf "$BACKUP_DIR/nginx.conf"
    echo "nginx.conf backed up" >> "$LOG_FILE"
else
    echo "nginx.conf not found" >> "$LOG_FILE"
fi

if [ -f /home/ubuntu/docker-compose.yml ]; then
    cp /home/ubuntu/docker-compose.yml "$BACKUP_DIR/docker-compose.yml"
    echo "docker-compose.yml backed up" >> "$LOG_FILE"
else
    echo "docker-compose.yml not found" >> "$LOG_FILE"
fi

#!/bin/bash

PROJECT_DIR="$HOME/ConfigTrackerX"
BACKUP_DIR="$PROJECT_DIR/backups"
LOG_FILE="$PROJECT_DIR/logs/backup.log"

echo "Backup started at $(date)" >> "$LOG_FILE"

mkdir -p "$BACKUP_DIR"

if [ -f /etc/ssh/sshd_config ]; then
    cp /etc/ssh/sshd_config "$BACKUP_DIR/sshd_config"
    echo "sshd_config backed up" >> "$LOG_FILE"
else
    echo "sshd_config not found" >> "$LOG_FILE"
fi

if [ -f /etc/nginx/nginx.conf ]; then
    cp /etc/nginx/nginx.conf "$BACKUP_DIR/nginx.conf"
    echo "nginx.conf backed up" >> "$LOG_FILE"
else
    echo "nginx.conf not found" >> "$LOG_FILE"
fi

if [ -f /home/ubuntu/docker-compose.yml ]; then
    cp /home/ubuntu/docker-compose.yml "$BACKUP_DIR/docker-compose.yml"
    echo "docker-compose.yml backed up" >> "$LOG_FILE"
else
    echo "docker-compose.yml not found" >> "$LOG_FILE"
fi

cd "$PROJECT_DIR"

git add backups logs

if git diff --cached --quiet; then
    echo "No changes to commit" >> "$LOG_FILE"
else
    git commit -m "Automatic config backup on $(date)"
    git push origin main
    echo "Changes committed and pushed" >> "$LOG_FILE"
fi

echo "Backup completed at $(date)" >> "$LOG_FILE"
echo "-----------------------------------" >> "$LOG_FILE"
