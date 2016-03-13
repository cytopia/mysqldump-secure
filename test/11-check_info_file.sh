#!/bin/bash -e
#!/usr/bin/env bash

ERROR=0

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. "${DIR}/config"



echo "##########################################################################################"
echo "#"
echo "#  11.  C H E C K I N G   I N F O   F I L E "
echo "#"
echo "##########################################################################################"



echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  11.1 \$DUMP_FILE_INFO"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 11.1.1 #DUMP_FILE_INFO=1"
echo "----------------------------------------"
echo
sed_change_config_file "^DUMP_FILE_INFO=1"  "#DUMP_FILE_INFO=1"

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "WARN" "1" "\$DUMP_FILE_INFO" "1" "1" "0" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	if [ "${RUN_CHECK_NORM}" = "1" ]; then
		echo "---------- NORMAL MODE ----------"
		CMD="${CMD_NORM}"
		if ! check "1" "1" "WARN" "1" "\$DUMP_FILE_INFO" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi
	fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "WARN" "1" "\$DUMP_FILE_INFO" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^#DUMP_FILE_INFO=1"  "DUMP_FILE_INFO=1"



echo
echo "----------------------------------------"
echo " 11.1.2 DUMP_FILE_INFO=2"
echo "----------------------------------------"
echo
sed_change_config_file "^DUMP_FILE_INFO=1"  "DUMP_FILE_INFO=2"

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "WARN" "1" "\$DUMP_FILE_INFO" "1" "1" "0" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	if [ "${RUN_CHECK_NORM}" = "1" ]; then
		echo "---------- NORMAL MODE ----------"
		CMD="${CMD_NORM}"
		if ! check "1" "1" "WARN" "1" "\$DUMP_FILE_INFO" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi
	fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "WARN" "1" "\$DUMP_FILE_INFO" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^DUMP_FILE_INFO=2"  "DUMP_FILE_INFO=1"



echo
echo "----------------------------------------"
echo " 11.1.3 DUMP_FILE_INFO=\"wrong\""
echo "----------------------------------------"
echo
sed_change_config_file "^DUMP_FILE_INFO=1"  "DUMP_FILE_INFO=\"wrong\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "WARN" "1" "\$DUMP_FILE_INFO" "1" "1" "0" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	if [ "${RUN_CHECK_NORM}" = "1" ]; then
		echo "---------- NORMAL MODE ----------"
		CMD="${CMD_NORM}"
		if ! check "1" "1" "WARN" "1" "\$DUMP_FILE_INFO" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi
	fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "WARN" "1" "\$DUMP_FILE_INFO" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^DUMP_FILE_INFO=\"wrong\""  "DUMP_FILE_INFO=1"



echo
echo "----------------------------------------"
echo " 11.1.4 DUMP_FILE_INFO=\"\""
echo "----------------------------------------"
echo
sed_change_config_file "^DUMP_FILE_INFO=1"  "DUMP_FILE_INFO=\"\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "WARN" "1" "\$DUMP_FILE_INFO" "1" "1" "0" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	if [ "${RUN_CHECK_NORM}" = "1" ]; then
		echo "---------- NORMAL MODE ----------"
		CMD="${CMD_NORM}"
		if ! check "1" "1" "WARN" "1" "\$DUMP_FILE_INFO" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi
	fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "WARN" "1" "\$DUMP_FILE_INFO" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^DUMP_FILE_INFO=\"\""  "DUMP_FILE_INFO=1"



echo
echo "----------------------------------------"
echo " 11.1.5 DUMP_FILE_INFO=0"
echo "----------------------------------------"
sed_change_config_file "^DUMP_FILE_INFO=1"  "DUMP_FILE_INFO=0"

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

sed_change_config_file "^DUMP_FILE_INFO=0"  "DUMP_FILE_INFO=1"





echo
echo
if [ "$ERROR" = "0" ]; then
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ [11] SUCCESS @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
else
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@  [11] FAILED: ${ERROR} Errors   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
fi
exit $ERROR
