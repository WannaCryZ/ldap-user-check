#!/bin/bash
LOG_FILE="/var/log/ldap/ldap_check_$(date +\%Y\%m\%d).log"
echo "===== 任务触发时间: $(date +'%Y-%m-%d %H:%M:%S') =====" >> $LOG_FILE
php /home/check_ldap_users.php >> $LOG_FILE 2>&1

