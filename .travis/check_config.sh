#!/bin/sh

ERROR=0


echo "################################################################################"
echo "#"
echo "#  2.  C H E C K I N G   C O N F I G U R A T I O N   F I L E"
echo "#"
echo "################################################################################"


echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  2.1. Output files/folders"
echo "-"
echo "--------------------------------------------------------------------------------"

echo "----------------------------------------"
echo " 2.1.1 \$DUMP_DIR_CHMOD"
echo "----------------------------------------"
echo "a)"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/DUMP_DIR_CHMOD="0700"/#DUMP_DIR_CHMOD="0700"/' /etc/mysqldump-secure.conf
echo "$\ mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> Expected" || { echo "--> Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo "$\ mysqldump-secure"
sudo mysqldump-secure && echo "--> Expected" || { echo "--> Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/#DUMP_DIR_CHMOD="0700"/DUMP_DIR_CHMOD="0700"/' /etc/mysqldump-secure.conf

echo "b)"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/DUMP_DIR_CHMOD="0700"/DUMP_DIR_CHMOD="0700a"/' /etc/mysqldump-secure.conf
echo "$\ mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> Expected" || { echo "--> Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo "$\ mysqldump-secure"
sudo mysqldump-secure && echo "--> Expected" || { echo "--> Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/DUMP_DIR_CHMOD="0700a"/DUMP_DIR_CHMOD="0700"/' /etc/mysqldump-secure.conf


echo "----------------------------------------"
echo " 2.1.2 \$DUMP_FILE_CHMOD"
echo "----------------------------------------"
echo "a)"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/DUMP_FILE_CHMOD="0400"/#DUMP_FILE_CHMOD="0400"/' /etc/mysqldump-secure.conf
sudo mysqldump-secure --cron && echo "--> Expected" || { echo "--> Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo mysqldump-secure && echo "--> Expected" || { echo "--> Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/#DUMP_FILE_CHMOD="0400"/DUMP_FILE_CHMOD="0400"/' /etc/mysqldump-secure.conf

echo "b)"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/DUMP_FILE_CHMOD="0400"/DUMP_FILE_CHMOD="0400a"/' /etc/mysqldump-secure.conf
sudo mysqldump-secure --cron && echo "--> Expected" || { echo "--> Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo mysqldump-secure && echo "--> Expected" || { echo "--> Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/DUMP_FILE_CHMOD="0400a"/DUMP_FILE_CHMOD="0400"/' /etc/mysqldump-secure.conf


exit $ERROR
