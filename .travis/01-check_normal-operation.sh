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
echo "\$ mysqldump-secure --test --verbose"
sudo mysqldump-secure --test --verbose && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }

echo
echo "----------------------------------------"
echo " 1.1.2 Test mode second run"
echo "----------------------------------------"
echo "\$ mysqldump-secure --test --verbose"
sudo mysqldump-secure --test --verbose && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }



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
echo "\$ mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }

echo
echo "----------------------------------------"
echo " 1.2.2 Normal mode second run"
echo "----------------------------------------"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo "\$ mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }

echo
echo "----------------------------------------"
echo " 1.2.3 Normal mode third run (del files)"
echo "----------------------------------------"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo touch -a -m -t 201512180130.09 /var/mysqldump-secure/delete-me-1.txt
sudo touch -a -m -t 201512180130.09 /var/mysqldump-secure/delete-me-2.txt
sudo touch -a -m -t 201512180130.09 /var/mysqldump-secure/delete-me-3.txt
sudo touch -a -m -t 201512180130.09 /var/mysqldump-secure/delete-me-4.txt
echo "\$ mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }




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
echo "\$ mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }

echo
echo "Unbound variable test"
unbound="$(sudo mysqldump-secure --cron 3>&2 2>&1 1>&3 > /dev/null | grep 'unbound variable')"
if [ "$unbound" != "" ]; then
	ERROR=1;
	echo "${txtpur}===> [FAIL] Unbound variable found.${txtrst}";
	echo "${txtpur}${unbound}{txtrst}"
else
	echo "${txtgrn}===> [OK] No Unbound variables found$.{txtrst}";
fi




echo
echo "----------------------------------------"
echo " 1.3.2 Cron mode second run"
echo "----------------------------------------"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo "\$ mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }

echo
echo "Unbound variable test"
unbound="$(sudo mysqldump-secure --cron 3>&2 2>&1 1>&3 > /dev/null | grep 'unbound variable')"
if [ "$unbound" != "" ]; then
	ERROR=1;
	echo "${txtpur}===> [FAIL] Unbound variable found.${txtrst}";
	echo "${txtpur}${unbound}{txtrst}"
else
	echo "${txtgrn}===> [OK] No Unbound variables found$.{txtrst}";
fi



echo
echo "----------------------------------------"
echo " 1.3.3 Cron mode third run (del files)"
echo "----------------------------------------"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo touch -a -m -t 201512180130.09 /var/mysqldump-secure/delete-me-1.txt
sudo touch -a -m -t 201512180130.09 /var/mysqldump-secure/delete-me-2.txt
sudo touch -a -m -t 201512180130.09 /var/mysqldump-secure/delete-me-3.txt
sudo touch -a -m -t 201512180130.09 /var/mysqldump-secure/delete-me-4.txt
echo "\$ mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }

echo
echo "Unbound variable test"
unbound="$(sudo mysqldump-secure --cron 3>&2 2>&1 1>&3 > /dev/null | grep 'unbound variable')"
if [ "$unbound" != "" ]; then
	ERROR=1;
	echo "${txtpur}===> [FAIL] Unbound variable found.${txtrst}";
	echo "${txtpur}${unbound}{txtrst}"
else
	echo "${txtgrn}===> [OK] No Unbound variables found$.{txtrst}";
fi


echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  1.4 cmd arguments"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 1.4.1 --help"
echo "----------------------------------------"
echo "\$ mysqldump-secure --help"
sudo mysqldump-secure --help && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }

echo
echo "Unbound variable test"
unbound="$(sudo mysqldump-secure --help 3>&2 2>&1 1>&3 > /dev/null | grep 'unbound variable')"
if [ "$unbound" != "" ]; then
	ERROR=1;
	echo "${txtpur}===> [FAIL] Unbound variable found.${txtrst}";
	echo "${txtpur}${unbound}{txtrst}"
else
	echo "${txtgrn}===> [OK] No Unbound variables found$.{txtrst}";
fi



echo
echo "----------------------------------------"
echo " 1.4.2 --conf (does not exist)"
echo "----------------------------------------"
echo "\$ mysqldump-secure --verbose --conf=/etc/nothere"
sudo mysqldump-secure --verbose --conf=/etc/nothere && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"

echo
echo "Unbound variable test"
unbound="$(sudo mysqldump-secure --verbose --conf=/etc/nothere 3>&2 2>&1 1>&3 > /dev/null | grep 'unbound variable')"
if [ "$unbound" != "" ]; then
	ERROR=1;
	echo "${txtpur}===> [FAIL] Unbound variable found.${txtrst}";
	echo "${txtpur}${unbound}{txtrst}"
else
	echo "${txtgrn}===> [OK] No Unbound variables found$.{txtrst}";
fi



echo
echo "----------------------------------------"
echo " 1.4.3 --conf (random file)"
echo "----------------------------------------"
echo "\$ mysqldump-secure --verbose --conf=/etc/mysqldump-secure.cnf"
sudo mysqldump-secure --verbose --conf=/etc/mysqldump-secure.cnf && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"

echo
echo "Unbound variable test"
unbound="$(sudo mysqldump-secure --verbose --conf=/etc/mysqldump-secure.cnf 3>&2 2>&1 1>&3 > /dev/null | grep 'unbound variable')"
if [ "$unbound" != "" ]; then
	ERROR=1;
	echo "${txtpur}===> [FAIL] Unbound variable found.${txtrst}";
	echo "${txtpur}${unbound}{txtrst}"
else
	echo "${txtgrn}===> [OK] No Unbound variables found$.{txtrst}";
fi



echo
echo "----------------------------------------"
echo " 1.4.4 wrong argument"
echo "----------------------------------------"
echo "\$ mysqldump-secure --wrong"
sudo mysqldump-secure --wrong && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"

echo
echo "Unbound variable test"
unbound="$(sudo mysqldump-secure --wrong 3>&2 2>&1 1>&3 > /dev/null | grep 'unbound variable')"
if [ "$unbound" != "" ]; then
	ERROR=1;
	echo "${txtpur}===> [FAIL] Unbound variable found.${txtrst}";
	echo "${txtpur}${unbound}{txtrst}"
else
	echo "${txtgrn}===> [OK] No Unbound variables found$.{txtrst}";
fi




echo
echo
if [ "$ERROR" = "0" ]; then
	echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
	echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ [01] SUCESS   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
	echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
else
	echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
	echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  [01] FAILED   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
	echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
fi
exit $ERROR
