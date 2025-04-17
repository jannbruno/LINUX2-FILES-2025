#!/bin/bash

LOGFILE="/var/log/system_maintenance.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

echo "======= System Maintenance Run: $DATE ========" >> $LOGFILE

# Update packages
echo "Updating packages..." >> $LOGFILE
apt update && apt upgrade -y >> $LOGFILE 2>&1

# Remove older log files
find /var/log -name "*.log" -mtime +7 -exec rm -f {} \; >> $LOGFILE 2>&1

# Disk usage
df -h >> $LOGFILE
du -sh /home/* 2>/dev/null | sort -hr | head -10 >> $LOGFILE

# Failed SSH login attempts check
echo "Failed SSH login attempts:"
grep "Failed password" /var/log/auth.log | tail -10 >> $LOGFILE

echo "======= End of System Maintenance =======" >> $LOGFILE
