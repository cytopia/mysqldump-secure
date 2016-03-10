#!/bin/bash -e
#!/usr/bin/env bash

ERROR=0

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. "${DIR}/config"



echo "##########################################################################################"
echo "#"
echo "#  5.  C H E C K I N G   C O N S I S T E N C Y   S E T T I N G S"
echo "#"
echo "##########################################################################################"



echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  5.1 \$CONSISTENT_DUMP_ONLY_INNODB"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 5.1.1 #CONSISTENT_DUMP_ONLY_INNODB=1"
echo "----------------------------------------"
echo
sed_change_config_file "^CONSISTENT_DUMP_ONLY_INNODB=1"  "#CONSISTENT_DUMP_ONLY_INNODB=1"

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "WARN" "1" "\$CONSISTENT_DUMP_ONLY_INNODB" "1" "1" "0" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "WARN" "1" "\$CONSISTENT_DUMP_ONLY_INNODB" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "WARN" "1" "\$CONSISTENT_DUMP_ONLY_INNODB" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^#CONSISTENT_DUMP_ONLY_INNODB=1"  "CONSISTENT_DUMP_ONLY_INNODB=1"



echo
echo "----------------------------------------"
echo " 5.1.2 CONSISTENT_DUMP_ONLY_INNODB=2"
echo "----------------------------------------"
echo
sed_change_config_file "^CONSISTENT_DUMP_ONLY_INNODB=1"  "CONSISTENT_DUMP_ONLY_INNODB=2"

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "ERR" "1" "\$CONSISTENT_DUMP_ONLY_INNODB" "1" "1" "0" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "ERR" "1" "\$CONSISTENT_DUMP_ONLY_INNODB" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "ERR" "1" "\$CONSISTENT_DUMP_ONLY_INNODB" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^CONSISTENT_DUMP_ONLY_INNODB=2"  "CONSISTENT_DUMP_ONLY_INNODB=1"



echo
echo "----------------------------------------"
echo " 5.1.3 CONSISTENT_DUMP_ONLY_INNODB=0"
echo "----------------------------------------"
echo
sed_change_config_file "^CONSISTENT_DUMP_ONLY_INNODB=1"  "CONSISTENT_DUMP_ONLY_INNODB=0"

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "PASS" "0" "" "1" "1" "0" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "PASS" "0" "" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "PASS" "0" "" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^CONSISTENT_DUMP_ONLY_INNODB=0"  "CONSISTENT_DUMP_ONLY_INNODB=1"



echo
echo "----------------------------------------"
echo " 5.1.4 CONSISTENT_DUMP_ONLY_INNODB=\"wrong\""
echo "----------------------------------------"
echo
sed_change_config_file "^CONSISTENT_DUMP_ONLY_INNODB=1"  "CONSISTENT_DUMP_ONLY_INNODB=\"wrong\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "ERR" "1" "\$CONSISTENT_DUMP_ONLY_INNODB" "1" "1" "0" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "ERR" "1" "\$CONSISTENT_DUMP_ONLY_INNODB" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "ERR" "1" "\$CONSISTENT_DUMP_ONLY_INNODB" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^CONSISTENT_DUMP_ONLY_INNODB=\"wrong\""  "CONSISTENT_DUMP_ONLY_INNODB=1"








echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  5.2 \$CONSISTENT_DUMP_NO_INNODB"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 5.2.1 #CONSISTENT_DUMP_NO_INNODB=1"
echo "----------------------------------------"
echo
sed_change_config_file "^CONSISTENT_DUMP_NO_INNODB=1"  "#CONSISTENT_DUMP_NO_INNODB=1"

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "WARN" "1" "\$CONSISTENT_DUMP_NO_INNODB" "1" "1" "0" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "WARN" "1" "\$CONSISTENT_DUMP_NO_INNODB" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "WARN" "1" "\$CONSISTENT_DUMP_NO_INNODB" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^#CONSISTENT_DUMP_NO_INNODB=1"  "CONSISTENT_DUMP_NO_INNODB=1"



echo
echo "----------------------------------------"
echo " 5.2.2 CONSISTENT_DUMP_NO_INNODB=2"
echo "----------------------------------------"
echo
sed_change_config_file "^CONSISTENT_DUMP_NO_INNODB=1"  "CONSISTENT_DUMP_NO_INNODB=2"

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "ERR" "1" "\$CONSISTENT_DUMP_NO_INNODB" "1" "1" "0" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "ERR" "1" "\$CONSISTENT_DUMP_NO_INNODB" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "ERR" "1" "\$CONSISTENT_DUMP_NO_INNODB" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^CONSISTENT_DUMP_NO_INNODB=2"  "CONSISTENT_DUMP_NO_INNODB=1"



echo
echo "----------------------------------------"
echo " 5.2.3 CONSISTENT_DUMP_NO_INNODB=0"
echo "----------------------------------------"
echo
sed_change_config_file "^CONSISTENT_DUMP_NO_INNODB=1"  "CONSISTENT_DUMP_NO_INNODB=0"

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "PASS" "0" "" "1" "1" "0" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "PASS" "0" "" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "PASS" "0" "" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^CONSISTENT_DUMP_NO_INNODB=0"  "CONSISTENT_DUMP_NO_INNODB=1"



echo
echo "----------------------------------------"
echo " 5.2.4 CONSISTENT_DUMP_NO_INNODB=\"wrong\""
echo "----------------------------------------"
echo
sed_change_config_file "^CONSISTENT_DUMP_NO_INNODB=1"  "CONSISTENT_DUMP_NO_INNODB=\"wrong\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "ERR" "1" "\$CONSISTENT_DUMP_NO_INNODB" "1" "1" "0" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "ERR" "1" "\$CONSISTENT_DUMP_NO_INNODB" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "ERR" "1" "\$CONSISTENT_DUMP_NO_INNODB" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^CONSISTENT_DUMP_NO_INNODB=\"wrong\""  "CONSISTENT_DUMP_NO_INNODB=1"











echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  5.3 \$CONSISTENT_DUMP_MIXED_INNODB"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 5.3.1 #CONSISTENT_DUMP_MIXED_INNODB=1"
echo "----------------------------------------"
echo
sed_change_config_file "^CONSISTENT_DUMP_MIXED_INNODB=1"  "#CONSISTENT_DUMP_MIXED_INNODB=1"

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "WARN" "1" "\$CONSISTENT_DUMP_MIXED_INNODB" "1" "1" "0" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "WARN" "1" "\$CONSISTENT_DUMP_MIXED_INNODB" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "WARN" "1" "\$CONSISTENT_DUMP_MIXED_INNODB" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^#CONSISTENT_DUMP_MIXED_INNODB=1"  "CONSISTENT_DUMP_MIXED_INNODB=1"



echo
echo "----------------------------------------"
echo " 5.3.2 CONSISTENT_DUMP_MIXED_INNODB=2"
echo "----------------------------------------"
echo
sed_change_config_file "^CONSISTENT_DUMP_MIXED_INNODB=1"  "CONSISTENT_DUMP_MIXED_INNODB=2"

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "PASS" "0" "" "1" "1" "0" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "PASS" "0" "" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "PASS" "0" "" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^CONSISTENT_DUMP_MIXED_INNODB=2"  "CONSISTENT_DUMP_MIXED_INNODB=1"



echo
echo "----------------------------------------"
echo " 5.3.3 CONSISTENT_DUMP_MIXED_INNODB=0"
echo "----------------------------------------"
echo
sed_change_config_file "^CONSISTENT_DUMP_MIXED_INNODB=1"  "CONSISTENT_DUMP_MIXED_INNODB=0"

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "PASS" "0" "" "1" "1" "0" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "PASS" "0" "" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "PASS" "0" "" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^CONSISTENT_DUMP_MIXED_INNODB=0"  "CONSISTENT_DUMP_MIXED_INNODB=1"



echo
echo "----------------------------------------"
echo " 5.3.4 CONSISTENT_DUMP_MIXED_INNODB=\"wrong\""
echo "----------------------------------------"
echo
sed_change_config_file "^CONSISTENT_DUMP_MIXED_INNODB=1"  "CONSISTENT_DUMP_MIXED_INNODB=\"wrong\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "ERR" "1" "\$CONSISTENT_DUMP_MIXED_INNODB" "1" "1" "0" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "ERR" "1" "\$CONSISTENT_DUMP_MIXED_INNODB" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "ERR" "1" "\$CONSISTENT_DUMP_MIXED_INNODB" "1" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^CONSISTENT_DUMP_MIXED_INNODB=\"wrong\""  "CONSISTENT_DUMP_MIXED_INNODB=1"




echo
echo
if [ "$ERROR" = "0" ]; then
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ [05] SUCCESS @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
else
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@  [05] FAILED: ${ERROR} Errors   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
fi
exit $ERROR
