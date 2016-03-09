#!/bin/bash -e
#!/usr/bin/env bash

ERROR=0

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. "${DIR}/config"



echo "##########################################################################################"
echo "#"
echo "#  7.  C H E C K I N G   C O M P R E S S I O N"
echo "#"
echo "##########################################################################################"



echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  7.1 \$COMPRESS"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 7.1.1 #COMPRESS=1"
echo "----------------------------------------"
echo
sed_change_config_file "^COMPRESS=1"  "#COMPRESS=1"

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "WARN" "1" "\$COMPRESS" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "WARN" "1" "\$COMPRESS" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "WARN" "1" "\$COMPRESS" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^#COMPRESS=1"  "COMPRESS=1"



echo
echo "----------------------------------------"
echo " 7.1.2 COMPRESS=2"
echo "----------------------------------------"
echo
sed_change_config_file "^COMPRESS=1"  "COMPRESS=2"

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "ERR" "1" "\$COMPRESS" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "ERR" "1" "\$COMPRESS" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "ERR" "1" "\$COMPRESS" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^COMPRESS=2"  "COMPRESS=1"



echo
echo "----------------------------------------"
echo " 7.1.3 COMPRESS=\"wrong\""
echo "----------------------------------------"
echo
sed_change_config_file "^COMPRESS=1"  "COMPRESS=\"wrong\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "ERR" "1" "\$COMPRESS" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "ERR" "1" "\$COMPRESS" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "ERR" "1" "\$COMPRESS" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^COMPRESS=\"wrong\""  "COMPRESS=1"



echo
echo "----------------------------------------"
echo " 7.1.4 COMPRESS=\"\""
echo "----------------------------------------"
echo
sed_change_config_file "^COMPRESS=1"  "COMPRESS=\"\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "WARN" "1" "\$COMPRESS" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "WARN" "1" "\$COMPRESS" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "WARN" "1" "\$COMPRESS" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^COMPRESS=\"\""  "COMPRESS=1"



echo
echo "----------------------------------------"
echo " 7.1.5 COMPRESS=0"
echo "----------------------------------------"
echo
sed_change_config_file "^COMPRESS=1"  "COMPRESS=0"

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "PASS" "0" "" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "PASS" "0" "" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "PASS" "0" "" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^COMPRESS=0"  "COMPRESS=1"







echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  7.2 \$COMPRESS_BIN"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 7.2.1 #COMPRESS_BIN=\"gzip\""
echo "----------------------------------------"
echo
sed_change_config_file "^COMPRESS_BIN=\"gzip\""  "#COMPRESS_BIN=\"gzip\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "WARN" "1" "\$COMPRESS_BIN" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "WARN" "1" "\$COMPRESS_BIN" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "WARN" "1" "\$COMPRESS_BIN" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^#COMPRESS_BIN=\"gzip\""  "COMPRESS_BIN=\"gzip\""




echo
echo "----------------------------------------"
echo " 7.2.2 COMPRESS_BIN=\"\""
echo "----------------------------------------"
echo
sed_change_config_file "^COMPRESS_BIN=\"gzip\""  "COMPRESS_BIN=\"\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "WARN" "1" "\$COMPRESS_BIN" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "WARN" "1" "\$COMPRESS_BIN" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "WARN" "1" "\$COMPRESS_BIN" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^COMPRESS_BIN=\"\""  "COMPRESS_BIN=\"gzip\""



echo
echo "----------------------------------------"
echo " 7.2.3 COMPRESS_BIN=\"wrong\""
echo "----------------------------------------"
echo
sed_change_config_file "^COMPRESS_BIN=\"gzip\""  "COMPRESS_BIN=\"wrong\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "ERR" "1" "\$COMPRESS_BIN" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "ERR" "1" "\$COMPRESS_BIN" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "ERR" "1" "\$COMPRESS_BIN" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^COMPRESS_BIN=\"wrong\""  "COMPRESS_BIN=\"gzip\""



echo
echo "----------------------------------------"
echo " 7.2.4 COMPRESS_BIN=\"false\""
echo "----------------------------------------"
echo
sed_change_config_file "^COMPRESS_BIN=\"gzip\""  "COMPRESS_BIN=\"false\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "FAIL" "1" "\[ERR\]\s*compression" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "FAIL" "1" "\[ERR\]\s*compression" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "FAIL" "1" "\[ERR\]\s*compression" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^COMPRESS_BIN=\"false\""  "COMPRESS_BIN=\"gzip\""





echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  7.3 \$COMPRESS_ARG"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 7.3.1 #COMPRESS_ARG=\"-9 --stdout\""
echo "----------------------------------------"
echo
sed_change_config_file "^COMPRESS_ARG=\"-9 --stdout\""  "#COMPRESS_ARG=\"-9 --stdout\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "WARN" "1" "\$COMPRESS_ARG" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "WARN" "1" "\$COMPRESS_ARG" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "WARN" "1" "\$COMPRESS_ARG" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^#COMPRESS_ARG=\"-9 --stdout\""  "COMPRESS_ARG=\"-9 --stdout\""



echo
echo "----------------------------------------"
echo " 7.3.2 COMPRESS_ARG=\"\""
echo "----------------------------------------"
echo
sed_change_config_file "^COMPRESS_ARG=\"-9 --stdout\""  "COMPRESS_ARG=\"\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "PASS" "0" "" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "PASS" "0" "" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "PASS" "0" "" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^COMPRESS_ARG=\"\""  "COMPRESS_ARG=\"-9 --stdout\""



echo
echo "----------------------------------------"
echo " 7.3.3 COMPRESS_ARG=\"wrong\" (encryption: on)"
echo "----------------------------------------"
echo
sed_change_config_file "^COMPRESS_ARG=\"-9 --stdout\""  "COMPRESS_ARG=\"wrong\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "FAIL" "1" "\[ERR\]\s*compression" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "FAIL" "1" "\[ERR\]\s*compression" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "FAIL" "1" "\[ERR\]\s*compression" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^COMPRESS_ARG=\"wrong\""  "COMPRESS_ARG=\"-9 --stdout\""



echo
echo "----------------------------------------"
echo " 7.3.4 COMPRESS_ARG=\"wrong\" (encryption: off)"
echo "----------------------------------------"
echo
sed_change_config_file "^ENCRYPT=1"  "ENCRYPT=0"
sed_change_config_file "^COMPRESS_ARG=\"-9 --stdout\""  "COMPRESS_ARG=\"wrong\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "FAIL" "1" "\[ERR\]\s*compression" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "FAIL" "1" "\[ERR\]\s*compression" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "FAIL" "1" "\[ERR\]\s*compression" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^COMPRESS_ARG=\"wrong\""  "COMPRESS_ARG=\"-9 --stdout\""
sed_change_config_file "^ENCRYPT=0"  "ENCRYPT=1"




echo
echo "----------------------------------------"
echo " 7.3.5 COMPRESS_ARG=\"--wrong\" (encryption: on)"
echo "----------------------------------------"
echo
sed_change_config_file "^COMPRESS_ARG=\"-9 --stdout\""  "COMPRESS_ARG=\"--wrong\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "FAIL" "1" "compression:" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "FAIL" "1" "compression:" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "FAIL" "1" "compression:" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^COMPRESS_ARG=\"--wrong\""  "COMPRESS_ARG=\"-9 --stdout\""



echo
echo "----------------------------------------"
echo " 7.3.6 COMPRESS_ARG=\"--wrong\" (encryption: off)"
echo "----------------------------------------"
echo
sed_change_config_file "^ENCRYPT=1"  "ENCRYPT=0"
sed_change_config_file "^COMPRESS_ARG=\"-9 --stdout\""  "COMPRESS_ARG=\"--wrong\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "FAIL" "1" "compression:" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "FAIL" "1" "compression:" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "FAIL" "1" "compression:" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^COMPRESS_ARG=\"--wrong\""  "COMPRESS_ARG=\"-9 --stdout\""
sed_change_config_file "^ENCRYPT=0"  "ENCRYPT=1"








echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  7.4 \$COMPRESS_EXT"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 7.4.1 #COMPRESS_EXT=\"gz\""
echo "----------------------------------------"
echo
sed_change_config_file "^COMPRESS_EXT=\"gz\"\$"  "#COMPRESS_EXT=\"gz\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "WARN" "1" "\$COMPRESS_EXT" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "WARN" "1" "\$COMPRESS_EXT" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "WARN" "1" "\$COMPRESS_EXT" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^#COMPRESS_EXT=\"gz\"\$"  "COMPRESS_EXT=\"gz\""



echo
echo "----------------------------------------"
echo " 7.4.2 COMPRESS_EXT=\"\""
echo "----------------------------------------"
echo
sed_change_config_file "^COMPRESS_EXT=\"gz\"\$"  "COMPRESS_EXT=\"\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "WARN" "1" "\$COMPRESS_EXT" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "WARN" "1" "\$COMPRESS_EXT" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "WARN" "1" "\$COMPRESS_EXT" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^COMPRESS_EXT=\"\"\$"  "COMPRESS_EXT=\"gz\""



echo
echo "----------------------------------------"
echo " 7.4.3 COMPRESS_EXT=\"/www/test\" (encryption: on)"
echo "----------------------------------------"
echo
sed_change_config_file "^COMPRESS_EXT=\"gz\"\$"  "COMPRESS_EXT=\"www/test\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "FAIL" "1" "\[ERR\]\s*compression" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "FAIL" "1" "\[ERR\]\s*compression" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "FAIL" "1" "\[ERR\]\s*compression" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^COMPRESS_EXT=\"www/test\"\$"  "COMPRESS_EXT=\"gz\""



echo
echo "----------------------------------------"
echo " 7.4.4 COMPRESS_EXT=\"/www/test\" (encryption: off)"
echo "----------------------------------------"
echo
sed_change_config_file "^ENCRYPT=1"  "ENCRYPT=0"
sed_change_config_file "^COMPRESS_EXT=\"gz\"\$"  "COMPRESS_EXT=\"www/test\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "FAIL" "1" "\[ERR\]\s*compression" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "FAIL" "1" "\[ERR\]\s*compression" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "FAIL" "1" "\[ERR\]\s*compression" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^COMPRESS_EXT=\"www/test\"\$"  "COMPRESS_EXT=\"gz\""
sed_change_config_file "^ENCRYPT=0"  "ENCRYPT=1"






echo
echo
if [ "$ERROR" = "0" ]; then
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ [07] SUCCESS @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
else
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@  [07] FAILED: ${ERROR} Errors   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
fi
exit $ERROR
