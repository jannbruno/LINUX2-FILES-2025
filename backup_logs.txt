#!/bin/bash

LOGFILE="/var/log/backup_logs.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

echo "======= NFS Backup Started $DATE =======" >> $LOGFILE

rsync -av --delete /home/ /mnt/nfs_storage/backup/home/ >> $LOGFILE 2>&1

echo "======= NFS Backup Ended $DATE ======="
