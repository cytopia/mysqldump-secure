#!/bin/bash -e
#!/usr/bin/env bash

ERROR=0

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. "${DIR}/config"



echo "##########################################################################################"
echo "#"
echo "#  11.  C H E C K I N G   M I S C   S E T T I N G S"
echo "#"
echo "##########################################################################################"



echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  11.1 \$TMP_DIR"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 11.1.1 #TMP_DIR=\"/tmp\""
echo "----------------------------------------"
sudo sed -i'' 's/^TMP_DIR/#TMP_DIR/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

echo "---------- CRON MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --cron"


mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$TMP_DIR" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi



echo "---------- NORMAL MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$TMP_DIR" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE VERBOSE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure -vv"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$TMP_DIR" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


sudo sed -i'' 's/^#TMP_DIR/TMP_DIR/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf





echo
echo "----------------------------------------"
echo " 11.1.2 TMP_DIR=\"\""
echo "----------------------------------------"
echo
sudo sed -i'' "s|^TMP_DIR=\"/tmp\"|TMP_DIR=\"\"|" ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

echo "---------- CRON MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --cron"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$TMP_DIR" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$TMP_DIR" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE VERBOSE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure -vv"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$TMP_DIR" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo sed -i'' "s|^TMP_DIR=\"\"|TMP_DIR=\"/tmp\"|" ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf





echo
echo "----------------------------------------"
echo " 11.1.3 TMP_DIR=\"/foo\""
echo "----------------------------------------"
echo
sudo sed -i'' "s|^TMP_DIR=\"/tmp\"|TMP_DIR=\"/foo\"|" ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

echo "---------- CRON MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --cron"

mds_recreate_datadir
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$TMP_DIR" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo rm -rf ${_INSTALL_PREFIX}var/mysqldump-secure/dir1/dir2

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure"

mds_recreate_datadir
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$TMP_DIR" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE VERBOSE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure -vv"

mds_recreate_datadir
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$TMP_DIR" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


sudo sed -i'' "s|^TMP_DIR=\"/foo\"|TMP_DIR=\"/tmp\"|" ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf







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
