#!/bin/bash -e
#!/usr/bin/env bash

ERROR=0

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. "${DIR}/config"



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
echo "\$ ${txtblu}${CMD_TEST}${txtrst}"

mds_remove_logfiles
mds_remove_datadir
if ! eval "${CMD_TEST}"; then ERROR=$((ERROR+1)); echo "${txtpur}===> [FAILED]${txtrst}"; fi




echo
echo "----------------------------------------"
echo " 1.1.2 Test mode second run"
echo "----------------------------------------"
echo "\$ ${txtblu}${CMD_TEST}${txtrst}"

mds_recreate_datadir
if ! eval "${CMD_TEST}"; then ERROR=$((ERROR+1)); echo "${txtpur}===> [FAILED]${txtrst}"; fi





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
echo "\$ ${txtblu}${CMD_VERB}${txtrst}"

mds_remove_logfiles
mds_remove_datadir
if ! eval "${CMD_VERB}"; then ERROR=$((ERROR+1)); echo "${txtpur}===> [FAILED]${txtrst}"; fi



echo
echo "----------------------------------------"
echo " 1.2.2 Normal mode second run"
echo "----------------------------------------"
echo "\$ ${txtblu}${CMD_VERB}${txtrst}"

mds_recreate_datadir
if ! eval "${CMD_VERB}"; then ERROR=$((ERROR+1)); echo "${txtpur}===> [FAILED]${txtrst}"; fi



echo
echo "----------------------------------------"
echo " 1.2.3 Normal mode third run (del files)"
echo "----------------------------------------"
echo "\$ ${txtblu}${CMD_VERB}${txtrst}"

mds_recreate_datadir
sudo touch -a -m -t 201512180130.09 ${_INSTALL_PREFIX}/var/mysqldump-secure/delete-me-1.txt
sudo touch -a -m -t 201512180130.09 ${_INSTALL_PREFIX}/var/mysqldump-secure/delete-me-2.txt
sudo touch -a -m -t 201512180130.09 ${_INSTALL_PREFIX}/var/mysqldump-secure/delete-me-3.txt
sudo touch -a -m -t 201512180130.09 ${_INSTALL_PREFIX}/var/mysqldump-secure/delete-me-4.txt
if ! eval "${CMD_VERB}"; then ERROR=$((ERROR+1)); echo "${txtpur}===> [FAILED]${txtrst}"; fi




echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  1.3 Cron mode (--cron)"
echo "-"
echo "--------------------------------------------------------------------------------"
echo "\$ ${txtblu}${CMD_CRON}${txtrst}"

echo
echo "----------------------------------------"
echo " 1.3.1 Cron mode first run"
echo "----------------------------------------"

mds_remove_logfiles
mds_remove_datadir
if ! eval "${CMD_CRON}"; then ERROR=$((ERROR+1)); echo "${txtpur}===> [FAILED]${txtrst}"; fi



echo
echo "----------------------------------------"
echo " 1.3.2 Cron mode second run"
echo "----------------------------------------"
echo "\$ ${txtblu}${CMD_CRON}${txtrst}"

mds_recreate_datadir
if ! eval "${CMD_CRON}"; then ERROR=$((ERROR+1)); echo "${txtpur}===> [FAILED]${txtrst}"; fi



echo
echo "----------------------------------------"
echo " 1.3.3 Cron mode third run (del files)"
echo "----------------------------------------"
echo "\$ ${txtblu}${CMD_CRON}${txtrst}"

mds_recreate_datadir
sudo touch -a -m -t 201512180130.09 ${_INSTALL_PREFIX}/var/mysqldump-secure/delete-me-1.txt
sudo touch -a -m -t 201512180130.09 ${_INSTALL_PREFIX}/var/mysqldump-secure/delete-me-2.txt
sudo touch -a -m -t 201512180130.09 ${_INSTALL_PREFIX}/var/mysqldump-secure/delete-me-3.txt
sudo touch -a -m -t 201512180130.09 ${_INSTALL_PREFIX}/var/mysqldump-secure/delete-me-4.txt
if ! eval "${CMD_CRON}"; then ERROR=$((ERROR+1)); echo "${txtpur}===> [FAILED]${txtrst}"; fi




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
echo "\$ ${txtblu}${CMD_HELP}${txtrst}"

mds_recreate_datadir
if ! eval "${CMD_HELP}"; then ERROR=$((ERROR+1)); echo "${txtpur}===> [FAILED]${txtrst}"; fi



echo
echo "----------------------------------------"
echo " 1.4.2 --conf (does not exist)"
echo "----------------------------------------"
echo "\$ ${txtblu}${CMD_VERB} --conf=${_INSTALL_PREFIX}/etc/nothere${txtrst}"

# MUST FAIL
mds_recreate_datadir
if eval "${CMD_VERB} --conf=${_INSTALL_PREFIX}/etc/nothere"; then ERROR=$((ERROR+1)); echo "${txtpur}===> [FAILED]${txtrst}"; fi



echo
echo "----------------------------------------"
echo " 1.4.3 --conf (random file)"
echo "----------------------------------------"
echo "\$ ${txtblu}${CMD_VERB} --conf=${_INSTALL_PREFIX}/etc/mysqldump-secure.cnf${txtrst}"

# MUST FAIL
mds_recreate_datadir
if eval "${CMD_VERB} --conf=${_INSTALL_PREFIX}/etc/mysqldump-secure.cnf"; then ERROR=$((ERROR+1)); echo "${txtpur}===> [FAILED]${txtrst}"; fi



echo
echo "----------------------------------------"
echo " 1.4.4 wrong argument"
echo "----------------------------------------"
echo "\$ ${txtblu}${CMD_VERB} --wrong${txtrst}"

# MUST FAIL
mds_recreate_datadir
if eval "${CMD_VERB} --wrong"; then ERROR=$((ERROR+1)); echo "${txtpur}===> [FAILED]${txtrst}"; fi




echo
echo
if [ "$ERROR" = "0" ]; then
	echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
	echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ [01] SUCCESS @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
	echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
else
	echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
	echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@  [01] FAILED: ${ERROR} Errors   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
	echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
fi
exit $ERROR
