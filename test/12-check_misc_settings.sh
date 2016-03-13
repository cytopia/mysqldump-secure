#!/bin/bash -e
#!/usr/bin/env bash

ERROR=0

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. "${DIR}/config"



echo "##########################################################################################"
echo "#"
echo "#  12.  C H E C K I N G   M I S C   S E T T I N G S"
echo "#"
echo "##########################################################################################"



echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  12.1 \$TMP_DIR"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 12.1.1 #TMP_DIR=\"/tmp\""
echo "----------------------------------------"
echo
sed_change_config_file "^TMP_DIR="  "#TMP_DIR="

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "WARN" "1" "\$TMP_DIR" "1" "1" "0" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "WARN" "1" "\$TMP_DIR" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "WARN" "1" "\$TMP_DIR" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^#TMP_DIR="  "TMP_DIR="



echo
echo "----------------------------------------"
echo " 12.1.2 TMP_DIR=\"\""
echo "----------------------------------------"
echo
sed_change_config_file "^TMP_DIR=\"/tmp\""  "TMP_DIR=\"\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "WARN" "1" "\$TMP_DIR" "1" "1" "0" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "WARN" "1" "\$TMP_DIR" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "WARN" "1" "\$TMP_DIR" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^TMP_DIR=\"\""  "TMP_DIR=\"/tmp\""



echo
echo "----------------------------------------"
echo " 12.1.3 TMP_DIR=\"/foo\""
echo "----------------------------------------"
echo
sed_change_config_file "^TMP_DIR=\"/tmp\""  "TMP_DIR=\"/foo\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "ABORT" "1" "\$TMP_DIR" "1" "1" "0" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "ABORT" "1" "\$TMP_DIR" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "ABORT" "1" "\$TMP_DIR" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^TMP_DIR=\"/foo\""  "TMP_DIR=\"/tmp\""



echo
echo
if [ "$ERROR" = "0" ]; then
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ [12] SUCCESS @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
else
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@  [12] FAILED: ${ERROR} Errors   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
fi
exit $ERROR
