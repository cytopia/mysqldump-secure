#!/bin/bash -e
#!/usr/bin/env bash

ERROR=0

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. "${DIR}/config"



echo "##########################################################################################"
echo "#"
echo "#  9.  C H E C K I N G   D E L E T I O N"
echo "#"
echo "##########################################################################################"




echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  9.1 \$DELETE"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 9.1.1 #DELETE=1"
echo "----------------------------------------"
echo
sed_change_config_file "^DELETE=1"  "#DELETE=1"

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "WARN" "1" "\$DELETE" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "WARN" "1" "\$DELETE" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "WARN" "1" "\$DELETE" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^#DELETE=1"  "DELETE=1"


echo
echo "----------------------------------------"
echo " 9.1.2 DELETE=2"
echo "----------------------------------------"
echo
sed_change_config_file "^DELETE=1"  "DELETE=2"

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "ERR" "1" "\$DELETE" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "ERR" "1" "\$DELETE" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "ERR" "1" "\$DELETE" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^DELETE=2"  "DELETE=1"


echo
echo "----------------------------------------"
echo " 9.1.3 DELETE=\"wrong\""
echo "----------------------------------------"
echo
sed_change_config_file "^DELETE=1"  "DELETE=\"wrong\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "ERR" "1" "\$DELETE" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "ERR" "1" "\$DELETE" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "ERR" "1" "\$DELETE" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^DELETE=\"wrong\""  "DELETE=1"



echo
echo "----------------------------------------"
echo " 9.1.4 DELETE=\"\""
echo "----------------------------------------"
echo
sed_change_config_file "^DELETE=1"  "DELETE=\"\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "WARN" "1" "\$DELETE" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "WARN" "1" "\$DELETE" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "WARN" "1" "\$DELETE" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^DELETE=\"\""  "DELETE=1"



echo
echo "----------------------------------------"
echo " 9.1.5 DELETE=0"
echo "----------------------------------------"
echo
sed_change_config_file "^DELETE=1"  "DELETE=0"

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "PASS" "0" " " "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "PASS" "0" " " "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "PASS" "0" " " "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^DELETE=0"  "DELETE=1"







echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  9.2 \$DELETE_METHOD"
echo "-"
echo "--------------------------------------------------------------------------------"


echo
echo "----------------------------------------"
echo " 9.2.1 #DELETE_METHOD=\"${TMPWATCH}\""
echo "----------------------------------------"
sed_change_config_file "^DELETE_METHOD=\"${TMPWATCH}\""  "#DELETE_METHOD=\"${TMPWATCH}\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "WARN" "1" "\$DELETE_METHOD" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "WARN" "1" "\$DELETE_METHOD" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "WARN" "1" "\$DELETE_METHOD" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^#DELETE_METHOD=\"${TMPWATCH}\""  "DELETE_METHOD=\"${TMPWATCH}\""


echo
echo "----------------------------------------"
echo " 9.2.2 DELETE_METHOD=\"\""
echo "----------------------------------------"
sed_change_config_file "^DELETE_METHOD=\"${TMPWATCH}\""  "DELETE_METHOD=\"\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "WARN" "1" "\$DELETE_METHOD" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "WARN" "1" "\$DELETE_METHOD" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "WARN" "1" "\$DELETE_METHOD" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^DELETE_METHOD=\"\""  "DELETE_METHOD=\"${TMPWATCH}\""


echo
echo "----------------------------------------"
echo " 9.2.3 DELETE_METHOD=\"wrong\""
echo "----------------------------------------"
sed_change_config_file "^DELETE_METHOD=\"${TMPWATCH}\""  "DELETE_METHOD=\"wrong\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "ERR" "1" "\$DELETE_METHOD" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "ERR" "1" "\$DELETE_METHOD" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "ERR" "1" "\$DELETE_METHOD" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^DELETE_METHOD=\"wrong\""  "DELETE_METHOD=\"${TMPWATCH}\""


echo
echo "----------------------------------------"
echo " 9.2.4 DELETE_METHOD=\"false\""
echo "----------------------------------------"
sed_change_config_file "^DELETE_METHOD=\"${TMPWATCH}\""  "DELETE_METHOD=\"false\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "ERR" "1" "\$DELETE_METHOD" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "ERR" "1" "\$DELETE_METHOD" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "ERR" "1" "\$DELETE_METHOD" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^DELETE_METHOD=\"false\""  "DELETE_METHOD=\"${TMPWATCH}\""




#
# TODO: Don't know the resulting error code
#


echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  9.3 \$DELETE_FORCE"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 9.3.1 #DELETE_FORCE=1 (on read-only files)"
echo "----------------------------------------"
sed_change_config_file "^DELETE_FORCE=1"  "#DELETE_FORCE=1"

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "WARN" "1" "\$DELETE_FORCE" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "WARN" "1" "\$DELETE_FORCE" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "WARN" "1" "\$DELETE_FORCE" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^#DELETE_FORCE=1"  "DELETE_FORCE=1"



echo
echo "----------------------------------------"
echo " 9.3.2 DELETE_FORCE=2 (on read-only files)"
echo "----------------------------------------"
sed_change_config_file "^DELETE_FORCE=1"  "DELETE_FORCE=2"

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "ERR" "1" "\$DELETE_FORCE" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "ERR" "1" "\$DELETE_FORCE" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "ERR" "1" "\$DELETE_FORCE" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^DELETE_FORCE=2"  "DELETE_FORCE=1"



echo
echo "----------------------------------------"
echo " 9.3.3 DELETE_FORCE=\"wrong\" (on read-only files)"
echo "----------------------------------------"
sed_change_config_file "^DELETE_FORCE=1"  "DELETE_FORCE=\"wrong\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "ERR" "1" "\$DELETE_FORCE" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "ERR" "1" "\$DELETE_FORCE" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "ERR" "1" "\$DELETE_FORCE" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^DELETE_FORCE=\"wrong\""  "DELETE_FORCE=1"



echo
echo "----------------------------------------"
echo " 9.3.4 DELETE_FORCE=\"\" (on read-only files)"
echo "----------------------------------------"
sed_change_config_file "^DELETE_FORCE=1"  "DELETE_FORCE=\"\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "WARN" "1" "\$DELETE_FORCE" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "WARN" "1" "\$DELETE_FORCE" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "WARN" "1" "\$DELETE_FORCE" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^DELETE_FORCE=\"\""  "DELETE_FORCE=1"



echo
echo "----------------------------------------"
echo " 9.3.5 DELETE_FORCE=0 (on read-only files)"
echo "----------------------------------------"
sed_change_config_file "^DELETE_FORCE=1"  "DELETE_FORCE=0"

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "WARN" "1" " skipped: " "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "WARN" "1" " skipped: " "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "WARN" "1" " skipped: " "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^DELETE_FORCE=0"  "DELETE_FORCE=1"






echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  9.4 \$DELETE_IF_OLDER"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 9.4.1 #DELETE_IF_OLDER=1m"
echo "----------------------------------------"
sed_change_config_file "^DELETE_IF_OLDER=1m"  "#DELETE_IF_OLDER=1m"

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "WARN" "1" "\$DELETE_IF_OLDER" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "WARN" "1" "\$DELETE_IF_OLDER" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "WARN" "1" "\$DELETE_IF_OLDER" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^#DELETE_IF_OLDER=1m"  "DELETE_IF_OLDER=1m"



echo
echo "----------------------------------------"
echo " 9.4.2 DELETE_IF_OLDER=0"
echo "----------------------------------------"
sed_change_config_file "^DELETE_IF_OLDER=1m"  "DELETE_IF_OLDER=0"

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "ERR" "1" "\$DELETE_IF_OLDER" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "ERR" "1" "\$DELETE_IF_OLDER" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "ERR" "1" "\$DELETE_IF_OLDER" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^DELETE_IF_OLDER=0"  "DELETE_IF_OLDER=1m"



echo
echo "----------------------------------------"
echo " 9.4.3 DELETE_IF_OLDER=\"wrong\""
echo "----------------------------------------"
sed_change_config_file "^DELETE_IF_OLDER=1m"  "DELETE_IF_OLDER=\"wrong\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "ERR" "1" "\$DELETE_IF_OLDER" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "ERR" "1" "\$DELETE_IF_OLDER" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "ERR" "1" "\$DELETE_IF_OLDER" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^DELETE_IF_OLDER=\"wrong\""  "DELETE_IF_OLDER=1m"



echo
echo "----------------------------------------"
echo " 9.4.4 DELETE_IF_OLDER=\"\""
echo "----------------------------------------"
sed_change_config_file "^DELETE_IF_OLDER=1m"  "DELETE_IF_OLDER=\"\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "WARN" "1" "\$DELETE_IF_OLDER" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "WARN" "1" "\$DELETE_IF_OLDER" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "WARN" "1" "\$DELETE_IF_OLDER" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^DELETE_IF_OLDER=\"\""  "DELETE_IF_OLDER=1m"





echo
echo
if [ "$ERROR" = "0" ]; then
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ [09] SUCCESS @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
else
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@  [09] FAILED: ${ERROR} Errors   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
fi
exit $ERROR
