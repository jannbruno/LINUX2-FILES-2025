#!/bin/bash
echo "System Health Check - $(date)" > /var/log/health_check.log
echo "Uptime:" >> /var/log/health_check.log
uptime >> /var/log/health_check.log
echo -e "\nCPU and Memory Usage:" >> /var/log/health_check.log
top -b -n1 | head -n 10 >> /var/log/health_check.log
echo -e "\nDisk Usage:" >> /var/log/health_check.log
df -h >> /var/log/health_check.log
echo -e "\nRecent Logins:" >> /var/log/health_check.log
last -a | head -n 5 >> /var/log/health_check.log
