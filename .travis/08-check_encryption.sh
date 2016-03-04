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
sudo sed -i'' 's/^ENCRYPT=1/#ENCRYPT=1/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf


echo "---------- CRON MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --cron"

mds_recreate_datadir
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$ENCRYPT" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure"

mds_recreate_datadir
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$ENCRYPT" "${CMD}"; then ERROR=$((ERROR+1)); fi

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
if ! expect_err_msg "\$ENCRYPT" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


sudo sed -i'' 's/^#ENCRYPT=1/ENCRYPT=1/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf



echo
echo "----------------------------------------"
echo " 8.1.2 ENCRYPT=2"
echo "----------------------------------------"
sudo sed -i'' 's/^ENCRYPT=1/ENCRYPT=2/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf


echo "---------- CRON MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --cron"

mds_recreate_datadir
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$ENCRYPT" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure"

mds_recreate_datadir
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$ENCRYPT" "${CMD}"; then ERROR=$((ERROR+1)); fi

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
if ! expect_err_msg "\$ENCRYPT" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


sudo sed -i'' 's/^ENCRYPT=2/ENCRYPT=1/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 8.1.3 ENCRYPT=\"wrong\""
echo "----------------------------------------"
sudo sed -i'' 's/^ENCRYPT=1/ENCRYPT="wrong"/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf


echo "---------- CRON MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --cron"

mds_recreate_datadir
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$ENCRYPT" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure"

mds_recreate_datadir
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$ENCRYPT" "${CMD}"; then ERROR=$((ERROR+1)); fi

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
if ! expect_err_msg "\$ENCRYPT" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


sudo sed -i'' 's/^ENCRYPT="wrong"/ENCRYPT=1/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 8.1.4 ENCRYPT=\"\""
echo "----------------------------------------"
sudo sed -i'' 's/^ENCRYPT=1/ENCRYPT=""/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf


echo "---------- CRON MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --cron"

mds_recreate_datadir
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$ENCRYPT" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure"

mds_recreate_datadir
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$ENCRYPT" "${CMD}"; then ERROR=$((ERROR+1)); fi

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
if ! expect_err_msg "\$ENCRYPT" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


sudo sed -i'' 's/^ENCRYPT=""/ENCRYPT=1/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf





echo
echo "----------------------------------------"
echo " 8.1.5 ENCRYPT=0"
echo "----------------------------------------"
sudo sed -i'' 's/^ENCRYPT=1/ENCRYPT=0/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf


echo "---------- CRON MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --cron"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

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
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


sudo sed -i'' 's/^ENCRYPT=0/ENCRYPT=1/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf




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
sudo sed -i'' 's/^OPENSSL_PUBKEY_PEM=/#OPENSSL_PUBKEY_PEM=/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf


echo "---------- CRON MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --cron"

mds_recreate_datadir
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$OPENSSL_PUBKEY_PEM" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure"

mds_recreate_datadir
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$OPENSSL_PUBKEY_PEM" "${CMD}"; then ERROR=$((ERROR+1)); fi

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
if ! expect_err_msg "\$OPENSSL_PUBKEY_PEM" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


sudo sed -i'' 's/^#OPENSSL_PUBKEY_PEM=/OPENSSL_PUBKEY_PEM=/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 8.2.2 OPENSSL_PUBKEY_PEM=\"\""
echo "----------------------------------------"
sudo sed -i'' "s|OPENSSL_PUBKEY_PEM=\"${_INSTALL_PREFIX}/etc/mysqldump-secure.pub.pem\"|OPENSSL_PUBKEY_PEM=\"\"|" ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf


echo "---------- CRON MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --cron"

mds_recreate_datadir
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$OPENSSL_PUBKEY_PEM" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure"

mds_recreate_datadir
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$OPENSSL_PUBKEY_PEM" "${CMD}"; then ERROR=$((ERROR+1)); fi

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
if ! expect_err_msg "\$OPENSSL_PUBKEY_PEM" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo sed -i'' "s|OPENSSL_PUBKEY_PEM=\"\"|OPENSSL_PUBKEY_PEM=\"${_INSTALL_PREFIX}/etc/mysqldump-secure.pub.pem\"|" ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf






echo
echo "----------------------------------------"
echo " 8.2.3 OPENSSL_PUBKEY_PEM=\"${_INSTALL_PREFIX}/etc/mysqldump-secure.pub.pem.notfound\""
echo "----------------------------------------"

sudo sed -i'' 's/mysqldump-secure.pub.pem/mysqldump-secure.pub.pem.notfound/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf


echo "---------- CRON MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --cron"

mds_recreate_datadir
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "etc/mysqldump-secure.pub.pem.notfound" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure"

mds_recreate_datadir
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "etc/mysqldump-secure.pub.pem.notfound" "${CMD}"; then ERROR=$((ERROR+1)); fi

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
if ! expect_err_msg "etc/mysqldump-secure.pub.pem.notfound" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


sudo sed -i'' 's/mysqldump-secure.pub.pem.notfound/mysqldump-secure.pub.pem/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf






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
sudo sed -i'' 's/^OPENSSL_ALGO_ARG="-aes256"$/#OPENSSL_ALGO_ARG="-aes256"/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

echo "---------- CRON MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --cron"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$OPENSSL_ALGO_ARG" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$OPENSSL_ALGO_ARG" "${CMD}"; then ERROR=$((ERROR+1)); fi

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
if ! expect_err_msg "\$OPENSSL_ALGO_ARG" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


sudo sed -i'' 's/^#OPENSSL_ALGO_ARG="-aes256"$/OPENSSL_ALGO_ARG="-aes256"/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 8.3.2 OPENSSL_ALGO_ARG=\"\""
echo "----------------------------------------"
sudo sed -i'' 's/^OPENSSL_ALGO_ARG="-aes256"$/OPENSSL_ALGO_ARG=""/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

echo "---------- CRON MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --cron"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$OPENSSL_ALGO_ARG" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$OPENSSL_ALGO_ARG" "${CMD}"; then ERROR=$((ERROR+1)); fi

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
if ! expect_err_msg "\$OPENSSL_ALGO_ARG" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


sudo sed -i'' 's/^OPENSSL_ALGO_ARG=""$/OPENSSL_ALGO_ARG="-aes256"/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf





echo
echo "----------------------------------------"
echo " 8.3.3 OPENSSL_ALGO_ARG=\"wrong\""
echo "----------------------------------------"
sudo sed -i'' 's/^OPENSSL_ALGO_ARG="-aes256"$/OPENSSL_ALGO_ARG="wrong"/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

echo "---------- CRON MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --cron"

mds_recreate_datadir
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$OPENSSL_ALGO_ARG" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure"

mds_recreate_datadir
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! expect_err_msg "\$OPENSSL_ALGO_ARG" "${CMD}"; then ERROR=$((ERROR+1)); fi

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
if ! expect_err_msg "\$OPENSSL_ALGO_ARG" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


sudo sed -i'' 's/^OPENSSL_ALGO_ARG="wrong"$/OPENSSL_ALGO_ARG="-aes256"/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf









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
