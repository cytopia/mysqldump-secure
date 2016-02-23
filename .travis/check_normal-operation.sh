#!/bin/sh

ERROR=0


echo "##########################################################################################"
echo "#"
echo "#  1.  C H E C K I N G   N O R M A L   O P E R A T I O N"
echo "#"
echo "##########################################################################################"


echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  1.1 Test mode"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 1.1.1 Test mode first run"
echo "----------------------------------------"
sudo mysqldump-secure --test && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }

echo
echo "----------------------------------------"
echo " 1.1.2 Test mode second run"
echo "----------------------------------------"
sudo mysqldump-secure --test && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }



echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  1.2 Normal mode"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 1.2.1 Normal mode first run"
echo "----------------------------------------"
sudo rm /var/log/mysqldump-secure.log 2>/dev/null
sudo rm /var/log/mysqldump-secure.nagios.log 2>/dev/null
sudo rm -rf /var/mysqldump-secure/ 2>/dev/null
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }

echo
echo "----------------------------------------"
echo " 1.2.2 Normal mode second run"
echo "----------------------------------------"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }

echo
echo "----------------------------------------"
echo " 1.2.3 Normal mode third run (del files)"
echo "----------------------------------------"
sudo touch -a -m -t 201512180130.09 /var/mysqldump-secure/delete-me-1.txt
sudo touch -a -m -t 201512180130.09 /var/mysqldump-secure/delete-me-2.txt
sudo touch -a -m -t 201512180130.09 /var/mysqldump-secure/delete-me-3.txt
sudo touch -a -m -t 201512180130.09 /var/mysqldump-secure/delete-me-4.txt
sudo mysqldump-secure  && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }




echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  1.3 Cron mode (--cron)"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 1.3.1 Cron mode first run"
echo "----------------------------------------"
sudo rm /var/log/mysqldump-secure.log 2>/dev/null
sudo rm /var/log/mysqldump-secure.nagios.log 2>/dev/null
sudo rm -rf /var/mysqldump-secure/ 2>/dev/null
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }

echo
echo "----------------------------------------"
echo " 1.3.2 Cron mode second run"
echo "----------------------------------------"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }

echo
echo "----------------------------------------"
echo " 1.3.3 Cron mode third run (del files)"
echo "----------------------------------------"
sudo touch -a -m -t 201512180130.09 /var/mysqldump-secure/delete-me-1.txt
sudo touch -a -m -t 201512180130.09 /var/mysqldump-secure/delete-me-2.txt
sudo touch -a -m -t 201512180130.09 /var/mysqldump-secure/delete-me-3.txt
sudo touch -a -m -t 201512180130.09 /var/mysqldump-secure/delete-me-4.txt
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }



exit $ERROR
