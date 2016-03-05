#!/bin/bash -e
#!/usr/bin/env bash

ERROR=0

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. "${DIR}/config"



echo "##########################################################################################"
echo "#"
echo "#  2.  C H E C K I N G   O U T P U T   F I L E S / F O L D E R S"
echo "#"
echo "##########################################################################################"



echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  2.1 \$DUMP_PATH"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 2.1.1 #DUMP_PATH=\"${_INSTALL_PREFIX}/var/mysqldump-secure/\""
echo "----------------------------------------"
echo
sed_change_config_file "^DUMP_PATH="  "#DUMP_PATH="

  echo "---------- CRON MODE ----------"
  CMD="${CMD_CRON}"
  if ! check "1" "1" "PASS" "1" "\$DUMP_PATH" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

  echo "---------- NORMAL MODE ----------"
  CMD="${CMD_NORM}"
  if ! check "1" "1" "PASS" "1" "\$DUMP_PATH" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

  echo "---------- NORMAL MODE VERBOSE ----------"
  CMD="${CMD_VERB}"
  if ! check "1" "1" "PASS" "1" "\$DUMP_PATH" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^#DUMP_PATH="  "DUMP_PATH="



echo
echo "----------------------------------------"
echo " 2.1.2 DUMP_PATH=\"${_INSTALL_PREFIX}/var/mysqldump-secure/dir1/dir2\""
echo "----------------------------------------"
echo
sed_change_config_file "^DUMP_PATH=\"${_INSTALL_PREFIX}/var/mysqldump-secure\""  "DUMP_PATH=\"${_INSTALL_PREFIX}/var/mysqldump-secure/dir1/dir2\""

  echo "---------- CRON MODE ----------"
  CMD="${CMD_CRON}"
  if ! check "1" "1" "PASS" "1" "dir1/dir2" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi
  sudo rm -rf ${_INSTALL_PREFIX}/var/mysqldump-secure/dir1/

  echo "---------- NORMAL MODE ----------"
  CMD="${CMD_NORM}"
  if ! check "1" "1" "PASS" "1" "dir1/dir2" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi
  sudo rm -rf ${_INSTALL_PREFIX}/var/mysqldump-secure/dir1/

  echo "---------- NORMAL MODE VERBOSE ----------"
  CMD="${CMD_VERB}"
  if ! check "1" "1" "PASS" "1" "dir1/dir2" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi
  sudo rm -rf ${_INSTALL_PREFIX}/var/mysqldump-secure/dir1/

sed_change_config_file "^DUMP_PATH=\"${_INSTALL_PREFIX}/var/mysqldump-secure/dir1/dir2\"" "DUMP_PATH=\"${_INSTALL_PREFIX}/var/mysqldump-secure\""




echo
echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  2.2 \$DUMP_DIR_CHMOD"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 2.2.1 #DUMP_DIR_CHMOD=\"0700\""
echo "----------------------------------------"
echo
sed_change_config_file "^DUMP_DIR_CHMOD=\"0700\""  "#DUMP_DIR_CHMOD=\"0700\""

  echo "---------- CRON MODE ----------"
  CMD="${CMD_CRON}"
  if ! check "1" "1" "PASS" "1" "\$DUMP_DIR_CHMOD" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

  echo "---------- NORMAL MODE ----------"
  CMD="${CMD_NORM}"
  if ! check "1" "1" "PASS" "1" "\$DUMP_DIR_CHMOD" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

  echo "---------- NORMAL MODE VERBOSE ----------"
  CMD="${CMD_VERB}"
  if ! check "1" "1" "PASS" "1" "\$DUMP_DIR_CHMOD" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^#DUMP_DIR_CHMOD=\"0700\""  "DUMP_DIR_CHMOD=\"0700\""



echo
echo "----------------------------------------"
echo " 2.2.2 DUMP_DIR_CHMOD=\"0700a\""
echo "----------------------------------------"
echo
sed_change_config_file "^DUMP_DIR_CHMOD=\"0700\""  "DUMP_DIR_CHMOD=\"0700a\""

  echo "---------- CRON MODE ----------"
  CMD="${CMD_CRON}"
  if ! check "1" "1" "PASS" "1" "\$DUMP_DIR_CHMOD" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

  echo "---------- NORMAL MODE ----------"
  CMD="${CMD_NORM}"
  if ! check "1" "1" "PASS" "1" "\$DUMP_DIR_CHMOD" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

  echo "---------- NORMAL MODE VERBOSE ----------"
  CMD="${CMD_VERB}"
  if ! check "1" "1" "PASS" "1" "\$DUMP_DIR_CHMOD" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^DUMP_DIR_CHMOD=\"0700a\""  "DUMP_DIR_CHMOD=\"0700\""



echo
echo "----------------------------------------"
echo " 2.2.3 DUMP_DIR_CHMOD=\"abc\""
echo "----------------------------------------"
echo
sed_change_config_file "^DUMP_DIR_CHMOD=\"0700\""  "DUMP_DIR_CHMOD=\"abc\""

  echo "---------- CRON MODE ----------"
  CMD="${CMD_CRON}"
  if ! check "1" "1" "PASS" "1" "\$DUMP_DIR_CHMOD" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

  echo "---------- NORMAL MODE ----------"
  CMD="${CMD_NORM}"
  if ! check "1" "1" "PASS" "1" "\$DUMP_DIR_CHMOD" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

  echo "---------- NORMAL MODE VERBOSE ----------"
  CMD="${CMD_VERB}"
  if ! check "1" "1" "PASS" "1" "\$DUMP_DIR_CHMOD" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^DUMP_DIR_CHMOD=\"abc\""  "DUMP_DIR_CHMOD=\"0700\""



echo
echo "----------------------------------------"
echo " 2.2.4 DUMP_DIR_CHMOD=\"\""
echo "----------------------------------------"
echo
sed_change_config_file "^DUMP_DIR_CHMOD=\"0700\""  "DUMP_DIR_CHMOD=\"\""

  echo "---------- CRON MODE ----------"
  CMD="${CMD_CRON}"
  if ! check "1" "1" "PASS" "1" "\$DUMP_DIR_CHMOD" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

  echo "---------- NORMAL MODE ----------"
  CMD="${CMD_NORM}"
  if ! check "1" "1" "PASS" "1" "\$DUMP_DIR_CHMOD" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

  echo "---------- NORMAL MODE VERBOSE ----------"
  CMD="${CMD_VERB}"
  if ! check "1" "1" "PASS" "1" "\$DUMP_DIR_CHMOD" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^DUMP_DIR_CHMOD=\"\""  "DUMP_DIR_CHMOD=\"0700\""




echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  2.3 \$DUMP_FILE_CHMOD"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 2.3.1 #DUMP_FILE_CHMOD=\"0400\""
echo "----------------------------------------"
echo
sed_change_config_file "^DUMP_FILE_CHMOD=\"0400\""  "#DUMP_FILE_CHMOD=\"0400\""

  echo "---------- CRON MODE ----------"
  CMD="${CMD_CRON}"
  if ! check "1" "1" "PASS" "1" "\$DUMP_FILE_CHMOD" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

  echo "---------- NORMAL MODE ----------"
  CMD="${CMD_NORM}"
  if ! check "1" "1" "PASS" "1" "\$DUMP_FILE_CHMOD" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

  echo "---------- NORMAL MODE VERBOSE ----------"
  CMD="${CMD_VERB}"
  if ! check "1" "1" "PASS" "1" "\$DUMP_FILE_CHMOD" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^#DUMP_FILE_CHMOD=\"0400\""  "DUMP_FILE_CHMOD=\"0400\""



echo
echo "----------------------------------------"
echo " 2.3.2 DUMP_FILE_CHMOD=\"0400a\""
echo "----------------------------------------"
echo
sed_change_config_file "^DUMP_FILE_CHMOD=\"0400\""  "DUMP_FILE_CHMOD=\"0400a\""

  echo "---------- CRON MODE ----------"
  CMD="${CMD_CRON}"
  if ! check "1" "1" "PASS" "1" "\$DUMP_FILE_CHMOD" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

  echo "---------- NORMAL MODE ----------"
  CMD="${CMD_NORM}"
  if ! check "1" "1" "PASS" "1" "\$DUMP_FILE_CHMOD" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

  echo "---------- NORMAL MODE VERBOSE ----------"
  CMD="${CMD_VERB}"
  if ! check "1" "1" "PASS" "1" "\$DUMP_FILE_CHMOD" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^DUMP_FILE_CHMOD=\"0400a\""  "DUMP_FILE_CHMOD=\"0400\""



echo
echo "----------------------------------------"
echo " 2.3.3 DUMP_FILE_CHMOD=\"abc\""
echo "----------------------------------------"
echo
sed_change_config_file "^DUMP_FILE_CHMOD=\"0400\""  "DUMP_FILE_CHMOD=\"abc\""

  echo "---------- CRON MODE ----------"
  CMD="${CMD_CRON}"
  if ! check "1" "1" "PASS" "1" "\$DUMP_FILE_CHMOD" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

  echo "---------- NORMAL MODE ----------"
  CMD="${CMD_NORM}"
  if ! check "1" "1" "PASS" "1" "\$DUMP_FILE_CHMOD" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

  echo "---------- NORMAL MODE VERBOSE ----------"
  CMD="${CMD_VERB}"
  if ! check "1" "1" "PASS" "1" "\$DUMP_FILE_CHMOD" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^DUMP_FILE_CHMOD=\"abc\""  "DUMP_FILE_CHMOD=\"0400\""




echo
echo "----------------------------------------"
echo " 2.3.4 DUMP_FILE_CHMOD=\"\""
echo "----------------------------------------"
echo
sed_change_config_file "^DUMP_FILE_CHMOD=\"0400\""  "DUMP_FILE_CHMOD=\"\""

  echo "---------- CRON MODE ----------"
  CMD="${CMD_CRON}"
  if ! check "1" "1" "PASS" "1" "\$DUMP_FILE_CHMOD" "1" "1" "0" "${CMD}"; then ERROR=$((ERROR+1)); fi

  echo "---------- NORMAL MODE ----------"
  CMD="${CMD_NORM}"
  if ! check "1" "1" "PASS" "1" "\$DUMP_FILE_CHMOD" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

  echo "---------- NORMAL MODE VERBOSE ----------"
  CMD="${CMD_VERB}"
  if ! check "1" "1" "PASS" "1" "\$DUMP_FILE_CHMOD" "1" "1" "1" "${CMD}"; then ERROR=$((ERROR+1)); fi

sed_change_config_file "^DUMP_FILE_CHMOD=\"\""  "DUMP_FILE_CHMOD=\"0400\""




echo
echo
if [ "$ERROR" = "0" ]; then
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ [02] SUCCESS @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
else
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@  [02] FAILED: ${ERROR} Errors   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
fi
exit $ERROR
