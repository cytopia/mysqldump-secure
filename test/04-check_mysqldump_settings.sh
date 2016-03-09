#!/bin/bash -e
#!/usr/bin/env bash

ERROR=0

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. "${DIR}/config"



echo "##########################################################################################"
echo "#"
echo "#  4.  C H E C K I N G   M Y S Q L D U M P   S E T T I N G S"
echo "#"
echo "##########################################################################################"



echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  4.1 \$MYSQL_OPTS"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 4.1.1 #MYSQL_OPTS"
echo "----------------------------------------"
echo
sed_change_config_file "^MYSQL_OPTS="  "#MYSQL_OPTS="

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "WARN" "1" "\$MYSQL_OPTS" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "WARN" "1" "\$MYSQL_OPTS" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "WARN" "1" "\$MYSQL_OPTS" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^#MYSQL_OPTS="  "MYSQL_OPTS="



echo
echo "----------------------------------------"
echo " 4.1.2 MYSQL_OPTS=\"--compress2\""
echo "----------------------------------------"
echo
sed_change_config_file " --compress"  " --compress2"

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "FAIL" "1" "--compress2" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "FAIL" "1" "--compress2" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "FAIL" "1" "--compress2" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file " --compress2"  " --compress"



echo
echo "----------------------------------------"
echo " 4.1.3 MYSQL_OPTS=\"--password\" (MYSQL_EVIL_OPTS)"
echo "----------------------------------------"
echo
sed_change_config_file " --compress"  " --password"

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "ABORT" "1" "--password" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "ABORT" "1" "--password" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "ABORT" "1" "--password" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file " --password"  " --compress"



echo
echo "----------------------------------------"
echo " 4.1.4 MYSQL_OPTS=\"--password=foo\" (MYSQL_EVIL_OPTS)"
echo "----------------------------------------"
echo
sed_change_config_file " --compress"  " --password=foo"

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "ABORT" "1" "--password" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "ABORT" "1" "--password" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "ABORT" "1" "--password" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file " --password=foo"  " --compress"



echo
echo "----------------------------------------"
echo " 4.1.5 MYSQL_OPTS=\"--defaults-extra-file\" (MYSQL_BAD_OPTS)"
echo "----------------------------------------"
echo
sed_change_config_file " --compress"  " --defaults-extra-file"

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "ABORT" "1" "--defaults-extra-file" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "ABORT" "1" "--defaults-extra-file" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "ABORT" "1" "--defaults-extra-file" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file " --defaults-extra-file"  " --compress"



echo
echo "----------------------------------------"
echo " 4.1.6 MYSQL_OPTS=\"--defaults-extra-file=foo\" (MYSQL_BAD_OPTS)"
echo "----------------------------------------"
echo
sed_change_config_file " --compress"  " --defaults-extra-file=foo"

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "ABORT" "1" "--defaults-extra-file" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "ABORT" "1" "--defaults-extra-file" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "ABORT" "1" "--defaults-extra-file" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file " --defaults-extra-file=foo"  " --compress"






echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  4.2 \$MYSQL_OPTS_QUICK_MIN_SIZE"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 4.2.1 #MYSQL_OPTS_QUICK_MIN_SIZE"
echo "----------------------------------------"
echo
sed_change_config_file "^MYSQL_OPTS_QUICK_MIN_SIZE="  "#MYSQL_OPTS_QUICK_MIN_SIZE="

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "WARN" "1" "\$MYSQL_OPTS_QUICK_MIN_SIZE" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "WARN" "1" "\$MYSQL_OPTS_QUICK_MIN_SIZE" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "WARN" "1" "\$MYSQL_OPTS_QUICK_MIN_SIZE" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^#MYSQL_OPTS_QUICK_MIN_SIZE="  "MYSQL_OPTS_QUICK_MIN_SIZE="



echo
echo "----------------------------------------"
echo " 4.2.2 MYSQL_OPTS_QUICK_MIN_SIZE=200abc"
echo "----------------------------------------"
echo
sed_change_config_file "^MYSQL_OPTS_QUICK_MIN_SIZE=200"  "MYSQL_OPTS_QUICK_MIN_SIZE=200abc"

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "ERR" "1" "\$MYSQL_OPTS_QUICK_MIN_SIZE" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "ERR" "1" "\$MYSQL_OPTS_QUICK_MIN_SIZE" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "ERR" "1" "\$MYSQL_OPTS_QUICK_MIN_SIZE" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^MYSQL_OPTS_QUICK_MIN_SIZE=200abc"  "MYSQL_OPTS_QUICK_MIN_SIZE=200"



echo
echo "----------------------------------------"
echo " 4.2.3 MYSQL_OPTS_QUICK_MIN_SIZE=0"
echo "----------------------------------------"
echo
sed_change_config_file "^MYSQL_OPTS_QUICK_MIN_SIZE=200"  "MYSQL_OPTS_QUICK_MIN_SIZE=0"

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "PASS" "0" "" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "PASS" "0" "" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "PASS" "0" "" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^MYSQL_OPTS_QUICK_MIN_SIZE=0"  "MYSQL_OPTS_QUICK_MIN_SIZE=200"






echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  4.3 \$IGNORE"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 4.3.1 #IGNORE=\"information_schema performance_schema\""
echo "----------------------------------------"
echo
sed_change_config_file "^IGNORE=\"information_schema performance_schema\""  "#IGNORE=\"information_schema performance_schema\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "WARN" "1" "\$IGNORE" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "WARN" "1" "\$IGNORE" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "WARN" "1" "\$IGNORE" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^#IGNORE=\"information_schema performance_schema\""  "IGNORE=\"information_schema performance_schema\""



echo
echo "----------------------------------------"
echo " 4.3.2 IGNORE=\"\""
echo "----------------------------------------"
echo
sed_change_config_file "^IGNORE=\"information_schema performance_schema\""  "IGNORE=\"\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "PASS" "0" "" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "PASS" "0" "" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "PASS" "0" "" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^IGNORE=\"\""  "IGNORE=\"information_schema performance_schema\""



echo
echo "----------------------------------------"
echo " 4.3.3 IGNORE=\"notfound performance_schema\""
echo "----------------------------------------"
echo
sed_change_config_file "^IGNORE=\"information_schema performance_schema\""  "IGNORE=\"DB_notfound *_schema\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "PASS" "0" "" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "PASS" "0" "" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "PASS" "0" "" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^IGNORE=\"DB_notfound *_schema\""  "IGNORE=\"information_schema performance_schema\""




echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  4.4 \$REQUIRE"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 4.4.1 #REQUIRE=\"mysql\""
echo "----------------------------------------"
echo
sed_change_config_file "^REQUIRE=\"mysql\""  "#REQUIRE=\"mysql\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "WARN" "1" "\$REQUIRE" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "WARN" "1" "\$REQUIRE" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "WARN" "1" "\$REQUIRE" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^#REQUIRE=\"mysql\""  "REQUIRE=\"mysql\""



echo
echo "----------------------------------------"
echo " 4.4.2 REQUIRE=\"\""
echo "----------------------------------------"
echo
sed_change_config_file "^REQUIRE=\"mysql\""  "REQUIRE=\"\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "PASS" "0" "" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "PASS" "0" "" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "PASS" "0" "" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^REQUIRE=\"\""  "REQUIRE=\"mysql\""


echo
echo "----------------------------------------"
echo " 4.4.3 REQUIRE="
echo "----------------------------------------"
echo
sed_change_config_file "^REQUIRE=\"mysql\""  "REQUIRE="

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "PASS" "0" "" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "PASS" "0" "" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "PASS" "0" "" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^REQUIRE="  "REQUIRE=\"mysql\""



echo
echo "----------------------------------------"
echo " 4.4.4 REQUIRE=\"DB_notfound\""
echo "----------------------------------------"
echo
sed_change_config_file "^REQUIRE=\"mysql\""  "REQUIRE=\"DB_notfound\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "FAIL" "1" "DB_notfound" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "FAIL" "1" "DB_notfound" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "FAIL" "1" "DB_notfound" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^REQUIRE=\"DB_notfound\""  "REQUIRE=\"mysql\""




echo
echo
if [ "$ERROR" = "0" ]; then
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ [04] SUCCESS @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
else
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@  [04] FAILED: ${ERROR} Errors   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
fi
exit $ERROR
