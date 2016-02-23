#!/bin/sh

ERROR=0


echo "################################################################################"
echo "#"
echo "#  1.  C H E C K I N G   N O R M A L   O P E R A T I O N"
echo "#"
echo "################################################################################"


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
echo " 1.1.1 Test mode second run"
echo "----------------------------------------"
sudo mysqldump-secure --test && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }


echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  1.2 Test mode (--cron)"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 1.2.1 Test mode (cron) first run"
echo "----------------------------------------"
sudo rm /var/log/mysqldump-secure.log
sudo rm /var/log/mysqldump-secure.nagios.log
sudo rm -rf /var/mysqldump-secure/
sudo mysqldump-secure --test --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }

echo
echo "----------------------------------------"
echo " 1.2.2 Test mode (cron) second run"
echo "----------------------------------------"
sudo mysqldump-secure --test --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }


echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  1.3 Normal mode"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 1.3.1 Normal mode first run"
echo "----------------------------------------"
sudo rm /var/log/mysqldump-secure.log
sudo rm /var/log/mysqldump-secure.nagios.log
sudo rm -rf /var/mysqldump-secure/
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }

echo
echo "----------------------------------------"
echo " 1.3.2 Normal mode second run"
echo "----------------------------------------"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }



echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  1.3 Normal mode (--cron)"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 1.3.1 Normal mode first run"
echo "----------------------------------------"
sudo rm /var/log/mysqldump-secure.log
sudo rm /var/log/mysqldump-secure.nagios.log
sudo rm -rf /var/mysqldump-secure/
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }

echo
echo "----------------------------------------"
echo " 1.3.2 Normal mode second run"
echo "----------------------------------------"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }




exit $ERROR
