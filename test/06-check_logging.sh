#!/bin/bash -e
#!/usr/bin/env bash

ERROR=0

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. "${DIR}/config"



echo "##########################################################################################"
echo "#"
echo "#  6.  C H E C K I N G   L O G G I N G"
echo "#"
echo "##########################################################################################"



echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  6.1 \$LOG"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 6.1.1 #LOG=2"
echo "----------------------------------------"
echo
sed_change_config_file "^LOG=2"  "#LOG=2"

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "WARN" "1" "\$LOG" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "WARN" "1" "\$LOG" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "WARN" "1" "\$LOG" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^#LOG=2"  "LOG=2"



echo
echo "----------------------------------------"
echo " 6.1.2 LOG=4"
echo "----------------------------------------"
echo
sed_change_config_file "^LOG=2"  "LOG=4"

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "ERR" "1" "\$LOG" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "ERR" "1" "\$LOG" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "ERR" "1" "\$LOG" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^LOG=4"  "LOG=2"



echo
echo "----------------------------------------"
echo " 6.1.3 LOG=\"wrong\""
echo "----------------------------------------"
echo
sed_change_config_file "^LOG=2"  "LOG=\"wrong\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "ERR" "1" "\$LOG" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "ERR" "1" "\$LOG" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "ERR" "1" "\$LOG" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^LOG=\"wrong\""  "LOG=2"



echo
echo "----------------------------------------"
echo " 6.1.4 LOG=0"
echo "----------------------------------------"
echo
sed_change_config_file "^LOG=2"  "LOG=0"

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "PASS" "0" "" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "PASS" "0" "" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "PASS" "0" "" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^LOG=0"  "LOG=2"




echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  6.2 \$LOG_CHMOD"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 6.2.1 #LOG_CHMOD=\"0600\""
echo "----------------------------------------"
echo
sed_change_config_file "^LOG_CHMOD=\"0600\""  "#LOG_CHMOD=\"0600\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "WARN" "1" "\$LOG_CHMOD" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "WARN" "1" "\$LOG_CHMOD" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "WARN" "1" "\$LOG_CHMOD" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^#LOG_CHMOD=\"0600\""  "LOG_CHMOD=\"0600\""



echo
echo "----------------------------------------"
echo " 6.2.2 LOG_CHMOD=\"0600a\""
echo "----------------------------------------"
echo
sed_change_config_file "^LOG_CHMOD=\"0600\""  "LOG_CHMOD=\"0600a\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "ERR" "1" "\$LOG_CHMOD" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "ERR" "1" "\$LOG_CHMOD" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "ERR" "1" "\$LOG_CHMOD" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^LOG_CHMOD=\"0600a\""  "LOG_CHMOD=\"0600\""



echo
echo "----------------------------------------"
echo " 6.2.3 LOG_CHMOD=\"wrong\""
echo "----------------------------------------"
echo
sed_change_config_file "^LOG_CHMOD=\"0600\""  "LOG_CHMOD=\"wrong\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "ERR" "1" "\$LOG_CHMOD" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "ERR" "1" "\$LOG_CHMOD" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "ERR" "1" "\$LOG_CHMOD" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^LOG_CHMOD=\"wrong\""  "LOG_CHMOD=\"0600\""



echo
echo "----------------------------------------"
echo " 6.2.4 LOG_CHMOD=\"\""
echo "----------------------------------------"
echo
sed_change_config_file "^LOG_CHMOD=\"0600\""  "LOG_CHMOD=\"\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "WARN" "1" "\$LOG_CHMOD" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "WARN" "1" "\$LOG_CHMOD" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "WARN" "1" "\$LOG_CHMOD" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^LOG_CHMOD=\"\""  "LOG_CHMOD=\"0600\""







echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  6.3 \$LOGFILE"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 6.3.1 #LOGFILE=\"${_INSTALL_PREFIX}/var/log/mysqldump-secure.log\""
echo "----------------------------------------"
echo
sed_change_config_file "^LOGFILE="  "#LOGFILE="

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "WARN" "1" "\$LOGFILE" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "WARN" "1" "\$LOGFILE" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "WARN" "1" "\$LOGFILE" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^#LOGFILE="  "LOGFILE="



echo
echo "----------------------------------------"
echo " 6.3.2 LOGFILE=\"/var/log/mysqldump-secure.log.wrong\""
echo "----------------------------------------"
echo
sed_change_config_file "/var/log/mysqldump-secure.log"  "/var/log/mysqldump-secure.log.wrong"

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "WARN" "1" "Logfile does not exist" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi
	sudo rm ${_INSTALL_PREFIX}/var/log/mysqldump-secure.log.wrong

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "WARN" "1" "Logfile does not exist" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi
	sudo rm ${_INSTALL_PREFIX}/var/log/mysqldump-secure.log.wrong

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "WARN" "1" "Logfile does not exist" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi
	sudo rm ${_INSTALL_PREFIX}/var/log/mysqldump-secure.log.wrong

sed_change_config_file "/var/log/mysqldump-secure.log.wrong"  "/var/log/mysqldump-secure.log"



echo
echo "----------------------------------------"
echo " 6.3.3 LOGFILE=\"/var/log/dir1/dir2/mysqldump-secure.log\""
echo "----------------------------------------"
echo
sed_change_config_file "/var/log/mysqldump-secure.log"  "/var/log/dir1/dir2/mysqldump-secure.log"

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "WARN" "1" "/var/log/dir1/dir2/mysqldump-secure.log" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi
	sudo rm -rf ${_INSTALL_PREFIX}/var/log/dir1

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "WARN" "1" "/var/log/dir1/dir2/mysqldump-secure.log" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi
	sudo rm -rf ${_INSTALL_PREFIX}/var/log/dir1

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "WARN" "1" "/var/log/dir1/dir2/mysqldump-secure.log" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi
	sudo rm -rf ${_INSTALL_PREFIX}/var/log/dir1

sed_change_config_file "/var/log/dir1/dir2/mysqldump-secure.log"  "/var/log/mysqldump-secure.log"







echo
echo
if [ "$ERROR" = "0" ]; then
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ [06] SUCCESS @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
else
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@  [06] FAILED: ${ERROR} Errors   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
fi
exit $ERROR
