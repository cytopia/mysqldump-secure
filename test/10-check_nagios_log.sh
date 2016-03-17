#!/bin/bash -e
#!/usr/bin/env bash

ERROR=0

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. "${DIR}/config"



echo "##########################################################################################"
echo "#"
echo "#  10.  C H E C K I N G   N A G I O S   L O G"
echo "#"
echo "##########################################################################################"



echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  10.1 \$NAGIOS_LOG"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 10.1.1 #NAGIOS_LOG=1"
echo "----------------------------------------"
echo
sed_change_config_file "^NAGIOS_LOG=1"  "#NAGIOS_LOG=1"

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "WARN" "1" "\$NAGIOS_LOG" "1" "1" "0" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	if [ "${RUN_CHECK_NORM}" = "1" ]; then
		echo "---------- NORMAL MODE ----------"
		CMD="${CMD_NORM}"
		if ! check "1" "1" "WARN" "1" "\$NAGIOS_LOG" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi
	fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "WARN" "1" "\$NAGIOS_LOG" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^#NAGIOS_LOG=1"  "NAGIOS_LOG=1"



echo
echo "----------------------------------------"
echo " 10.1.2 NAGIOS_LOG=2"
echo "----------------------------------------"
echo
sed_change_config_file "^NAGIOS_LOG=1"  "NAGIOS_LOG=2"

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "ERR" "1" "\$NAGIOS_LOG" "1" "1" "0" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	if [ "${RUN_CHECK_NORM}" = "1" ]; then
		echo "---------- NORMAL MODE ----------"
		CMD="${CMD_NORM}"
		if ! check "1" "1" "ERR" "1" "\$NAGIOS_LOG" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi
	fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "ERR" "1" "\$NAGIOS_LOG" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^NAGIOS_LOG=2"  "NAGIOS_LOG=1"



echo
echo "----------------------------------------"
echo " 10.1.3 NAGIOS_LOG=\"wrong\""
echo "----------------------------------------"
echo
sed_change_config_file "^NAGIOS_LOG=1"  "NAGIOS_LOG=\"wrong\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "ERR" "1" "\$NAGIOS_LOG" "1" "1" "0" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	if [ "${RUN_CHECK_NORM}" = "1" ]; then
		echo "---------- NORMAL MODE ----------"
		CMD="${CMD_NORM}"
		if ! check "1" "1" "ERR" "1" "\$NAGIOS_LOG" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi
	fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "ERR" "1" "\$NAGIOS_LOG" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^NAGIOS_LOG=\"wrong\""  "NAGIOS_LOG=1"



echo
echo "----------------------------------------"
echo " 10.1.4 NAGIOS_LOG=\"\""
echo "----------------------------------------"
echo
sed_change_config_file "^NAGIOS_LOG=1"  "NAGIOS_LOG=\"\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "WARN" "1" "\$NAGIOS_LOG" "1" "1" "0" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	if [ "${RUN_CHECK_NORM}" = "1" ]; then
		echo "---------- NORMAL MODE ----------"
		CMD="${CMD_NORM}"
		if ! check "1" "1" "WARN" "1" "\$NAGIOS_LOG" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi
	fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "WARN" "1" "\$NAGIOS_LOG" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^NAGIOS_LOG=\"\""  "NAGIOS_LOG=1"



echo
echo "----------------------------------------"
echo " 10.1.5 NAGIOS_LOG=0"
echo "----------------------------------------"
sed_change_config_file "^NAGIOS_LOG=1"  "NAGIOS_LOG=0"

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "PASS" "0" "" "1" "1" "0" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	if [ "${RUN_CHECK_NORM}" = "1" ]; then
		echo "---------- NORMAL MODE ----------"
		CMD="${CMD_NORM}"
		if ! check "1" "1" "PASS" "0" "" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi
	fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "PASS" "0" "" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^NAGIOS_LOG=0"  "NAGIOS_LOG=1"






echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  10.2 \$NAGIOS_LOG_FILE"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 10.2.1 #NAGIOS_LOG_FILE=\"${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log\""
echo "----------------------------------------"
sed_change_config_file "^NAGIOS_LOG_FILE="  "#NAGIOS_LOG_FILE="

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "WARN" "1" "\$NAGIOS_LOG_FILE" "1" "1" "0" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	if [ "${RUN_CHECK_NORM}" = "1" ]; then
		echo "---------- NORMAL MODE ----------"
		CMD="${CMD_NORM}"
		if ! check "1" "1" "WARN" "1" "\$NAGIOS_LOG_FILE" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi
	fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "WARN" "1" "\$NAGIOS_LOG_FILE" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^#NAGIOS_LOG_FILE="  "NAGIOS_LOG_FILE="



echo
echo "----------------------------------------"
echo " 10.2.2 NAGIOS_LOG_FILE=\"\""
echo "----------------------------------------"
sed_change_config_file "^NAGIOS_LOG_FILE=\"${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log\""  "NAGIOS_LOG_FILE=\"\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "WARN" "1" "\$NAGIOS_LOG_FILE" "1" "1" "0" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	if [ "${RUN_CHECK_NORM}" = "1" ]; then
		echo "---------- NORMAL MODE ----------"
		CMD="${CMD_NORM}"
		if ! check "1" "1" "WARN" "1" "\$NAGIOS_LOG_FILE" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi
	fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "WARN" "1" "\$NAGIOS_LOG_FILE" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^NAGIOS_LOG_FILE=\"\""  "NAGIOS_LOG_FILE=\"${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log\""



echo
echo "----------------------------------------"
echo " 10.2.3 NAGIOS_LOG_FILE=\"${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log.notfound\""
echo "----------------------------------------"
sed_change_config_file "^NAGIOS_LOG_FILE=\"${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log\""  "NAGIOS_LOG_FILE=\"${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log.notfound\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "WARN" "1" "mysqldump-secure.nagios.log.notfound" "1" "1" "0" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi
	sudo rm -rf "${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log.notfound"

	if [ "${RUN_CHECK_NORM}" = "1" ]; then
		echo "---------- NORMAL MODE ----------"
		CMD="${CMD_NORM}"
		if ! check "1" "1" "WARN" "1" "mysqldump-secure.nagios.log.notfound" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi
		sudo rm -rf "${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log.notfound"
	fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "WARN" "1" "mysqldump-secure.nagios.log.notfound" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi
	sudo rm -rf "${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log.notfound"

sed_change_config_file "^NAGIOS_LOG_FILE=\"${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log.notfound\""  "NAGIOS_LOG_FILE=\"${_INSTALL_PREFIX}/var/log/mysqldump-secure.nagios.log\""







echo
echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  10.3 \$NAGIOS_LOG_CHMOD"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 10.3.1 #NAGIOS_LOG_CHMOD=\"0644\""
echo "----------------------------------------"
sed_change_config_file "^NAGIOS_LOG_CHMOD=\"0644\""  "#NAGIOS_LOG_CHMOD=\"0644\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "WARN" "1" "\$NAGIOS_LOG_CHMOD" "1" "1" "0" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	if [ "${RUN_CHECK_NORM}" = "1" ]; then
		echo "---------- NORMAL MODE ----------"
		CMD="${CMD_NORM}"
		if ! check "1" "1" "WARN" "1" "\$NAGIOS_LOG_CHMOD" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi
	fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "WARN" "1" "\$NAGIOS_LOG_CHMOD" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^#NAGIOS_LOG_CHMOD=\"0644\""  "NAGIOS_LOG_CHMOD=\"0644\""



echo
echo "----------------------------------------"
echo " 10.3.2 NAGIOS_LOG_CHMOD=\"0644a\""
echo "----------------------------------------"
sed_change_config_file "^NAGIOS_LOG_CHMOD=\"0644\""  "NAGIOS_LOG_CHMOD=\"0644a\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "ERR" "1" "\$NAGIOS_LOG_CHMOD" "1" "1" "0" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	if [ "${RUN_CHECK_NORM}" = "1" ]; then
		echo "---------- NORMAL MODE ----------"
		CMD="${CMD_NORM}"
		if ! check "1" "1" "ERR" "1" "\$NAGIOS_LOG_CHMOD" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi
	fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "ERR" "1" "\$NAGIOS_LOG_CHMOD" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^NAGIOS_LOG_CHMOD=\"0644a\""  "NAGIOS_LOG_CHMOD=\"0644\""


echo
echo "----------------------------------------"
echo " 10.3.3 NAGIOS_LOG_CHMOD=\"abc\""
echo "----------------------------------------"
sed_change_config_file "^NAGIOS_LOG_CHMOD=\"0644\""  "NAGIOS_LOG_CHMOD=\"abc\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "ERR" "1" "\$NAGIOS_LOG_CHMOD" "1" "1" "0" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	if [ "${RUN_CHECK_NORM}" = "1" ]; then
		echo "---------- NORMAL MODE ----------"
		CMD="${CMD_NORM}"
		if ! check "1" "1" "ERR" "1" "\$NAGIOS_LOG_CHMOD" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi
	fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "ERR" "1" "\$NAGIOS_LOG_CHMOD" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^NAGIOS_LOG_CHMOD=\"abc\""  "NAGIOS_LOG_CHMOD=\"0644\""



echo
echo "----------------------------------------"
echo " 10.3.4 NAGIOS_LOG_CHMOD=\"\""
echo "----------------------------------------"
sed_change_config_file "^NAGIOS_LOG_CHMOD=\"0644\""  "NAGIOS_LOG_CHMOD=\"\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "WARN" "1" "\$NAGIOS_LOG_CHMOD" "1" "1" "0" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	if [ "${RUN_CHECK_NORM}" = "1" ]; then
		echo "---------- NORMAL MODE ----------"
		CMD="${CMD_NORM}"
		if ! check "1" "1" "WARN" "1" "\$NAGIOS_LOG_CHMOD" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi
	fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "WARN" "1" "\$NAGIOS_LOG_CHMOD" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^NAGIOS_LOG_CHMOD=\"\""  "NAGIOS_LOG_CHMOD=\"0644\""



echo
echo "----------------------------------------"
echo " 10.3.5 NAGIOS_LOG_CHMOD=\"444\""
echo "----------------------------------------"
echo
sed_change_config_file "^NAGIOS_LOG_CHMOD=\"0644\""  "NAGIOS_LOG_CHMOD=\"444\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "WARN" "0" "" "1" "1" "0" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	if [ "${RUN_CHECK_NORM}" = "1" ]; then
		echo "---------- NORMAL MODE ----------"
		CMD="${CMD_NORM}"
		if ! check "1" "1" "WARN" "0" "" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi
	fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "WARN" "0" "" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^NAGIOS_LOG_CHMOD=\"444\""  "NAGIOS_LOG_CHMOD=\"0644\""




echo
echo
if [ "$ERROR" = "0" ]; then
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ [10] SUCCESS @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
else
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@  [10] FAILED: ${ERROR} Errors   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
fi
exit $ERROR
