#!/bin/bash -e
#!/usr/bin/env bash

ERROR=0

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. "${DIR}/config"



echo "##########################################################################################"
echo "#"
echo "#  8.  C H E C K I N G   E N C R Y P T I O N"
echo "#"
echo "##########################################################################################"



echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  8.1 \$ENCRYPT"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 8.1.1 #ENCRYPT=1"
echo "----------------------------------------"
echo
sed_change_config_file "^ENCRYPT=1"  "#ENCRYPT=1"

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "FAIL" "1" "\$ENCRYPT" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "FAIL" "1" "\$ENCRYPT" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "FAIL" "1" "\$ENCRYPT" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^#ENCRYPT=1"  "ENCRYPT=1"



echo
echo "----------------------------------------"
echo " 8.1.2 ENCRYPT=2"
echo "----------------------------------------"
echo
sed_change_config_file "^ENCRYPT=1"  "ENCRYPT=2"

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "FAIL" "1" "\$ENCRYPT" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "FAIL" "1" "\$ENCRYPT" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "FAIL" "1" "\$ENCRYPT" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^ENCRYPT=2"  "ENCRYPT=1"



echo
echo "----------------------------------------"
echo " 8.1.3 ENCRYPT=\"wrong\""
echo "----------------------------------------"
echo
sed_change_config_file "^ENCRYPT=1"  "ENCRYPT=\"wrong\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "FAIL" "1" "\$ENCRYPT" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "FAIL" "1" "\$ENCRYPT" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "FAIL" "1" "\$ENCRYPT" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^ENCRYPT=\"wrong\""  "ENCRYPT=1"



echo
echo "----------------------------------------"
echo " 8.1.4 ENCRYPT=\"\""
echo "----------------------------------------"
echo
sed_change_config_file "^ENCRYPT=1"  "ENCRYPT=\"\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "FAIL" "1" "\$ENCRYPT" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "FAIL" "1" "\$ENCRYPT" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "FAIL" "1" "\$ENCRYPT" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^ENCRYPT=\"\""  "ENCRYPT=1"



echo
echo "----------------------------------------"
echo " 8.1.5 ENCRYPT=0"
echo "----------------------------------------"
echo
sed_change_config_file "^ENCRYPT=1"  "ENCRYPT=0"

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "PASS" "0" "" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "PASS" "0" "" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "PASS" "0" "" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^ENCRYPT=0"  "ENCRYPT=1"








echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  8.2 \$OPENSSL_PUBKEY_PEM"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 8.2.1 #OPENSSL_PUBKEY_PEM=\"${_INSTALL_PREFIX}/etc/mysqldump-secure.pub.pem\""
echo "----------------------------------------"
echo
sed_change_config_file "^OPENSSL_PUBKEY_PEM="  "#OPENSSL_PUBKEY_PEM="

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "FAIL" "1" "\$OPENSSL_PUBKEY_PEM" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "FAIL" "1" "\$OPENSSL_PUBKEY_PEM" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "FAIL" "1" "\$OPENSSL_PUBKEY_PEM" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^#OPENSSL_PUBKEY_PEM="  "OPENSSL_PUBKEY_PEM="


echo
echo "----------------------------------------"
echo " 8.2.2 OPENSSL_PUBKEY_PEM=\"\""
echo "----------------------------------------"
echo
sed_change_config_file "^OPENSSL_PUBKEY_PEM=\"${_INSTALL_PREFIX}/etc/mysqldump-secure.pub.pem\""  "OPENSSL_PUBKEY_PEM=\"\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "FAIL" "1" "\$OPENSSL_PUBKEY_PEM" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "FAIL" "1" "\$OPENSSL_PUBKEY_PEM" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "FAIL" "1" "\$OPENSSL_PUBKEY_PEM" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^OPENSSL_PUBKEY_PEM=\"\""  "OPENSSL_PUBKEY_PEM=\"${_INSTALL_PREFIX}/etc/mysqldump-secure.pub.pem\""



echo
echo "----------------------------------------"
echo " 8.2.3 OPENSSL_PUBKEY_PEM=\"${_INSTALL_PREFIX}/etc/mysqldump-secure.pub.pem.notfound\""
echo "----------------------------------------"
echo
sed_change_config_file "^OPENSSL_PUBKEY_PEM=\"${_INSTALL_PREFIX}/etc/mysqldump-secure.pub.pem\""  "OPENSSL_PUBKEY_PEM=\"${_INSTALL_PREFIX}/etc/mysqldump-secure.pub.pem.notfound\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "FAIL" "1" "etc/mysqldump-secure.pub.pem.notfound" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "FAIL" "1" "etc/mysqldump-secure.pub.pem.notfound" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "FAIL" "1" "etc/mysqldump-secure.pub.pem.notfound" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^OPENSSL_PUBKEY_PEM=\"${_INSTALL_PREFIX}/etc/mysqldump-secure.pub.pem.notfound\""  "OPENSSL_PUBKEY_PEM=\"${_INSTALL_PREFIX}/etc/mysqldump-secure.pub.pem\""





echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  8.3 \$OPENSSL_ALGO_ARG"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 8.3.1 #OPENSSL_ALGO_ARG=\"-aes256\""
echo "----------------------------------------"
echo
sed_change_config_file "^OPENSSL_ALGO_ARG=\"-aes256\""  "#OPENSSL_ALGO_ARG=\"-aes256\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "PASS" "1" "\$OPENSSL_ALGO_ARG" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "PASS" "1" "\$OPENSSL_ALGO_ARG" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "PASS" "1" "\$OPENSSL_ALGO_ARG" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^#OPENSSL_ALGO_ARG=\"-aes256\""  "OPENSSL_ALGO_ARG=\"-aes256\""



echo
echo "----------------------------------------"
echo " 8.3.2 OPENSSL_ALGO_ARG=\"\""
echo "----------------------------------------"
echo
sed_change_config_file "^OPENSSL_ALGO_ARG=\"-aes256\""  "OPENSSL_ALGO_ARG=\"\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "PASS" "1" "\$OPENSSL_ALGO_ARG" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "PASS" "1" "\$OPENSSL_ALGO_ARG" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "PASS" "1" "\$OPENSSL_ALGO_ARG" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^OPENSSL_ALGO_ARG=\"\""  "OPENSSL_ALGO_ARG=\"-aes256\""



echo
echo "----------------------------------------"
echo " 8.3.3 OPENSSL_ALGO_ARG=\"wrong\""
echo "----------------------------------------"
echo
sed_change_config_file "^OPENSSL_ALGO_ARG=\"-aes256\""  "OPENSSL_ALGO_ARG=\"wrong\""

	echo "---------- CRON MODE ----------"
	CMD="${CMD_CRON}"
	if ! check "1" "1" "FAIL" "1" "\$OPENSSL_ALGO_ARG" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE ----------"
	CMD="${CMD_NORM}"
	if ! check "1" "1" "FAIL" "1" "\$OPENSSL_ALGO_ARG" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

	echo "---------- NORMAL MODE VERBOSE ----------"
	CMD="${CMD_VERB}"
	if ! check "1" "1" "FAIL" "1" "\$OPENSSL_ALGO_ARG" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^OPENSSL_ALGO_ARG=\"wrong\""  "OPENSSL_ALGO_ARG=\"-aes256\""





echo
echo
if [ "$ERROR" = "0" ]; then
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ [08] SUCCESS @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
else
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@  [08] FAILED: ${ERROR} Errors   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
fi
exit $ERROR
