#!/bin/sh

ERROR=0


txtgrn=$(tput setaf 2) # Green
txtylw=$(tput setaf 3) # Yellow
txtblu=$(tput setaf 4) # Blue
txtpur=$(tput setaf 5) # Purple
txtcyn=$(tput setaf 6) # Cyan
txtwht=$(tput setaf 7) # White
txtrst=$(tput sgr0) # Text reset.


echo "##########################################################################################"
echo "#"
echo "#  5.  C H E C K I N G   L O G G I N G"
echo "#"
echo "##########################################################################################"



echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  5.1 \$LOG"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 5.1.1 #LOG=1"
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^LOG=1/#LOG=1/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/

echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo sed -i'' 's/^#LOG=1/LOG=1/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 5.1.2 LOG=2"
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^LOG=1/LOG=2/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/

echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo sed -i'' 's/^LOG=2/LOG=1/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 5.1.3 LOG=\"wrong\""
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^LOG=1/LOG="wrong"/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/

echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo sed -i'' 's/^LOG="wrong"/LOG=1/' /etc/mysqldump-secure.conf




echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  5.2 \$LOG_CHMOD"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 5.2.1 #LOG_CHMOD=\"0600\""
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^LOG_CHMOD="0600"/#LOG_CHMOD="0600"/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/

echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo sed -i'' 's/^#LOG_CHMOD="0600"/LOG_CHMOD="0600"/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 5.2.2 LOG_CHMOD=\"0600a\""
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^LOG_CHMOD="0600"/LOG_CHMOD="0600a"/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/

echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo sed -i'' 's/^#LOG_CHMOD="0600a"/LOG_CHMOD="0600"/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 5.2.3 LOG_CHMOD=\"wrong\""
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^LOG_CHMOD="0600"/LOG_CHMOD="wrong"/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/

echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo sed -i'' 's/^LOG_CHMOD="wrong"/LOG_CHMOD="0600"/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 5.2.4 LOG_CHMOD=\"\""
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^LOG_CHMOD="0600"/LOG_CHMOD=""/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/

echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo sed -i'' 's/^LOG_CHMOD=""/LOG_CHMOD="0600"/' /etc/mysqldump-secure.conf



echo
echo "----------------------------------------"
echo " 5.2.5 LOG_CHMOD="
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^LOG_CHMOD="0600"/LOG_CHMOD=/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/

echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo sed -i'' 's/^LOG_CHMOD=/LOG_CHMOD="0600"/' /etc/mysqldump-secure.conf




echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  5.3 \$LOGFILE"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 5.3.1 #LOGFILE=\"/var/log/mysqldump-secure.log\""
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^LOGFILE=/#LOGFILE=/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/

echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo sed -i'' 's/^#LOGFILE=/LOGFILE=/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 5.3.2 LOGFILE=\"/var/log/mysqldump-secure.log.wrong\""
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/mysqldump-secure.log/mysqldump-secure.log.wrong/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/

echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo sed -i'' 's/mysqldump-secure.log.wrong/mysqldump-secure.log/' /etc/mysqldump-secure.conf



echo
echo "----------------------------------------"
echo " 5.3.3 LOGFILE=\"/var/log/dir1/dir2/mysqldump-secure.log\""
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/mysqldump-secure.log/\/dir1\/dir2\/mysqldump-secure.log/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/

echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo sed -i'' 's/\/dir1\/dir2\/mysqldump-secure.log/mysqldump-secure.log/' /etc/mysqldump-secure.conf








echo
echo
if [ "$ERROR" = "0" ]; then
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ [05] SUCESS   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
else
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  [05] FAILED   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
fi
exit $ERROR
