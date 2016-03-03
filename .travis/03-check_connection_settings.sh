#!/usr/bin/env bash

ERROR=0

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. "${DIR}/config"



echo "##########################################################################################"
echo "#"
echo "#  3.  C H E C K I N G   M Y S Q L   C O N N E C T I O N   S E T T I N G S"
echo "#"
echo "##########################################################################################"



echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  3.1 \$MYSQL_CNF_FILE"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 3.1.1 #MYSQL_CNF_FILE=\"/etc/mysqldump-secure.cnf\""
echo "----------------------------------------"
sudo sed -i'' 's/^MYSQL_CNF_FILE=/#MYSQL_CNF_FILE=/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

echo "---------- CRON MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --cron"

mds_recreate_datadir
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure"

mds_recreate_datadir
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE VERBOSE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --verbose"

mds_recreate_datadir
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


sudo sed -i'' 's/^#MYSQL_CNF_FILE=/MYSQL_CNF_FILE=/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 3.1.2 MYSQL_CNF_FILE=\"/etc/mysqldump-secure.cnf2\""
echo "----------------------------------------"
sudo sed -i'' 's/mysqldump-secure.cnf/mysqldump-secure.cnf2/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

echo "---------- CRON MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --cron"

mds_recreate_datadir
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure"

mds_recreate_datadir
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE VERBOSE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --verbose"

mds_recreate_datadir
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo sed -i'' 's/mysqldump-secure.cnf2/mysqldump-secure.cnf/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf





echo
echo "----------------------------------------"
echo " 3.1.3 MYSQL_CNF_FILE=\"\""
echo "----------------------------------------"
sudo sed -i'' "s|MYSQL_CNF_FILE=\"${_INSTALL_PREFIX}/etc/mysqldump-secure.cnf\"|MYSQL_CNF_FILE=\"\"|" ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

echo "---------- CRON MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --cron"

mds_recreate_datadir
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure"

mds_recreate_datadir
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE VERBOSE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --verbose"

mds_recreate_datadir
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


sudo sed -i'' "s|MYSQL_CNF_FILE=\"\"|MYSQL_CNF_FILE=\"${_INSTALL_PREFIX}/etc/mysqldump-secure.cnf\"|" ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf





echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  3.2 \$MYSQL_SSL_ENABLE"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 3.2.1 #MYSQL_SSL_ENABLE=1"
echo "----------------------------------------"
sudo sed -i'' 's/MYSQL_SSL_ENABLE/#MYSQL_SSL_ENABLE/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

echo "---------- CRON MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --cron"

mds_recreate_datadir
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure"

mds_recreate_datadir
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE VERBOSE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --verbose"

mds_recreate_datadir
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


sudo sed -i'' 's/#MYSQL_SSL_ENABLE/MYSQL_SSL_ENABLE/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 3.2.2 MYSQL_SSL_ENABLE=2"
echo "----------------------------------------"
sudo sed -i'' 's/MYSQL_SSL_ENABLE=1/MYSQL_SSL_ENABLE=2/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

echo "---------- CRON MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --cron"

mds_recreate_datadir
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure"

mds_recreate_datadir
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE VERBOSE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --verbose"

mds_recreate_datadir
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo sed -i'' 's/MYSQL_SSL_ENABLE=2/MYSQL_SSL_ENABLE=1/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf





echo
echo "----------------------------------------"
echo " 3.2.3 MYSQL_SSL_ENABLE="
echo "----------------------------------------"
sudo sed -i'' 's/^MYSQL_SSL_ENABLE=1/MYSQL_SSL_ENABLE=/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

echo "---------- CRON MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --cron"

mds_recreate_datadir
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure"

mds_recreate_datadir
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE VERBOSE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --verbose"

mds_recreate_datadir
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


sudo sed -i'' 's/^MYSQL_SSL_ENABLE=/MYSQL_SSL_ENABLE=1/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf



echo
echo "----------------------------------------"
echo " 3.2.4 MYSQL_SSL_ENABLE=0"
echo "----------------------------------------"
sudo sed -i'' 's/MYSQL_SSL_ENABLE=1/MYSQL_SSL_ENABLE=0/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

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
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --verbose"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


sudo sed -i'' 's/MYSQL_SSL_ENABLE=0/MYSQL_SSL_ENABLE=1/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf






echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  3.3 \$MYSQL_SSL_CA_PEM"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 3.3.1 #MYSQL_SSL_CA_PEM"
echo "----------------------------------------"
sudo sed -i'' 's/MYSQL_SSL_CA_PEM/#MYSQL_SSL_CA_PEM/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

echo "---------- CRON MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --cron"

mds_recreate_datadir
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure"

mds_recreate_datadir
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE VERBOSE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --verbose"

mds_recreate_datadir
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


sudo sed -i'' 's/#MYSQL_SSL_CA_PEM/MYSQL_SSL_CA_PEM/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 3.3.2 ca.pem.notfound"
echo "----------------------------------------"
sudo sed -i'' 's/ca.pem/ca.pem.notfound/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

echo "---------- CRON MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --cron"

mds_recreate_datadir
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure"

mds_recreate_datadir
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE VERBOSE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --verbose"

mds_recreate_datadir
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


sudo sed -i'' 's/ca.pem.notfound/ca.pem/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

  # 9.f [ABORT] $MYSQL_SSL_CLIENT_CERT_PEM
  # TODO:
  #- echo "---------- \$MYSQL_SSL_CLIENT_CERT_PEM ----------"
  #- sudo sed -i'' 's/MYSQL_SSL_CLIENT_CERT_PEM/#MYSQL_SSL_CLIENT_CERT_PEM/' /etc/mysqldump-secure.conf
  #- sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --cron
  #- sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure
  #- sudo sed -i'' 's/#MYSQL_SSL_CLIENT_CERT_PEM/MYSQL_SSL_CLIENT_CERT_PEM/' /etc/mysqldump-secure.conf

  #- echo "---------- \$MYSQL_SSL_CLIENT_CERT_PEM ----------"
  #- sudo sed -i'' 's/client-cert.pem/client-cert.pem2/' /etc/mysqldump-secure.conf
  #- sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --cron
  #- sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure
  #- sudo sed -i'' 's/client-cert.pem2/client-cert.pem/' /etc/mysqldump-secure.conf


  # 9.g [ABORT] $MYSQL_SSL_CLIENT_KEY_PEM
  # TODO:
  #- echo "---------- \$MYSQL_SSL_CLIENT_KEY_PEM ----------"
  #- sudo sed -i'' 's/MYSQL_SSL_CLIENT_KEY_PEM/#MYSQL_SSL_CLIENT_KEY_PEM/' /etc/mysqldump-secure.conf
  #- sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --cron
  #- sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure
  #- sudo sed -i'' 's/#MYSQL_SSL_CLIENT_KEY_PEM/MYSQL_SSL_CLIENT_KEY_PEM/' /etc/mysqldump-secure.conf

  #- echo "---------- \$MYSQL_SSL_CLIENT_KEY_PEM ----------"
  #- sudo sed -i'' 's/client-key.pem/client-key.pem2/' /etc/mysqldump-secure.conf
  #- sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --cron
  #- sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure
  #- sudo sed -i'' 's/client-key.pem2/client-key.pem/' /etc/mysqldump-secure.conf









echo
echo
if [ "$ERROR" = "0" ]; then
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ [03] SUCCESS @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
else
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@  [03] FAILED: ${ERROR} Errors   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
fi
exit $ERROR
