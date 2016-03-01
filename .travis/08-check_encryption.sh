#!/usr/bin/env bash

ERROR=0

. "./.travis/functions.bash"




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
sudo sed -i'' 's/^ENCRYPT=1/#ENCRYPT=1/' /etc/mysqldump-secure.conf


echo "---------- CRON MODE ----------"
CMD="sudo mysqldump-secure --cron"

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE ----------"
CMD="sudo mysqldump-secure"

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE VERBOSE ----------"
CMD="sudo mysqldump-secure --verbose"

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


sudo sed -i'' 's/^#ENCRYPT=1/ENCRYPT=1/' /etc/mysqldump-secure.conf



echo
echo "----------------------------------------"
echo " 8.1.2 ENCRYPT=2"
echo "----------------------------------------"
sudo sed -i'' 's/^ENCRYPT=1/ENCRYPT=2/' /etc/mysqldump-secure.conf


echo "---------- CRON MODE ----------"
CMD="sudo mysqldump-secure --cron"

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE ----------"
CMD="sudo mysqldump-secure"

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE VERBOSE ----------"
CMD="sudo mysqldump-secure --verbose"

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


sudo sed -i'' 's/^ENCRYPT=2/ENCRYPT=1/' /etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 8.1.3 ENCRYPT=\"wrong\""
echo "----------------------------------------"
sudo sed -i'' 's/^ENCRYPT=1/ENCRYPT="wrong"/' /etc/mysqldump-secure.conf


echo "---------- CRON MODE ----------"
CMD="sudo mysqldump-secure --cron"

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE ----------"
CMD="sudo mysqldump-secure"

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE VERBOSE ----------"
CMD="sudo mysqldump-secure --verbose"

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


sudo sed -i'' 's/^ENCRYPT="wrong"/ENCRYPT=1/' /etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 8.1.4 ENCRYPT=\"\""
echo "----------------------------------------"
sudo sed -i'' 's/^ENCRYPT=1/ENCRYPT=""/' /etc/mysqldump-secure.conf


echo "---------- CRON MODE ----------"
CMD="sudo mysqldump-secure --cron"

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE ----------"
CMD="sudo mysqldump-secure"

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE VERBOSE ----------"
CMD="sudo mysqldump-secure --verbose"

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


sudo sed -i'' 's/^ENCRYPT=""/ENCRYPT=1/' /etc/mysqldump-secure.conf





echo
echo "----------------------------------------"
echo " 8.1.5 ENCRYPT=0"
echo "----------------------------------------"
sudo sed -i'' 's/^ENCRYPT=1/ENCRYPT=0/' /etc/mysqldump-secure.conf


echo "---------- CRON MODE ----------"
CMD="sudo mysqldump-secure --cron"

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE ----------"
CMD="sudo mysqldump-secure"

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE VERBOSE ----------"
CMD="sudo mysqldump-secure --verbose"

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


sudo sed -i'' 's/^ENCRYPT=0/ENCRYPT=1/' /etc/mysqldump-secure.conf







echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  8.2 \$OPENSSL_PUBKEY_PEM"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 8.2.1 #OPENSSL_PUBKEY_PEM=\"\${_INSTALL_PREFIX}/etc/mysqldump-secure.pub.pem\""
echo "----------------------------------------"
sudo sed -i'' 's/^OPENSSL_PUBKEY_PEM/#OPENSSL_PUBKEY_PEM/' /etc/mysqldump-secure.conf


echo "---------- CRON MODE ----------"
CMD="sudo mysqldump-secure --cron"

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE ----------"
CMD="sudo mysqldump-secure"

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE VERBOSE ----------"
CMD="sudo mysqldump-secure --verbose"

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


sudo sed -i'' 's/^#OPENSSL_PUBKEY_PEM/OPENSSL_PUBKEY_PEM/' /etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 8.2.2 OPENSSL_PUBKEY_PEM=\"\""
echo "----------------------------------------"
sudo sed -i'' 's/OPENSSL_PUBKEY_PEM="\${_INSTALL_PREFIX}\/etc\/mysqldump-secure.pub.pem"/OPENSSL_PUBKEY_PEM=""/' /etc/mysqldump-secure.conf


echo "---------- CRON MODE ----------"
CMD="sudo mysqldump-secure --cron"

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE ----------"
CMD="sudo mysqldump-secure"

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE VERBOSE ----------"
CMD="sudo mysqldump-secure --verbose"

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


sudo sed -i'' 's/OPENSSL_PUBKEY_PEM=""/OPENSSL_PUBKEY_PEM="\${_INSTALL_PREFIX}\/etc\/mysqldump-secure.pub.pem"/' /etc/mysqldump-secure.conf






echo
echo "----------------------------------------"
echo " 8.2.3 OPENSSL_PUBKEY_PEM=\"\${_INSTALL_PREFIX}/etc/mysqldump-secure.pub.pem.notfound\""
echo "----------------------------------------"

sudo sed -i'' 's/mysqldump-secure.pub.pem/mysqldump-secure.pub.pem.notfound/' /etc/mysqldump-secure.conf


echo "---------- CRON MODE ----------"
CMD="sudo mysqldump-secure --cron"

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE ----------"
CMD="sudo mysqldump-secure"

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE VERBOSE ----------"
CMD="sudo mysqldump-secure --verbose"

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


sudo sed -i'' 's/mysqldump-secure.pub.pem.notfound/mysqldump-secure.pub.pem/' /etc/mysqldump-secure.conf






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
sudo sed -i'' 's/^OPENSSL_ALGO_ARG="-aes256"$/#OPENSSL_ALGO_ARG="-aes256"/' /etc/mysqldump-secure.conf

echo "---------- CRON MODE ----------"
CMD="sudo mysqldump-secure --cron"

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE ----------"
CMD="sudo mysqldump-secure"

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE VERBOSE ----------"
CMD="sudo mysqldump-secure --verbose"

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


sudo sed -i'' 's/^#OPENSSL_ALGO_ARG="-aes256"$/OPENSSL_ALGO_ARG="-aes256"/' /etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 8.3.2 OPENSSL_ALGO_ARG=\"\""
echo "----------------------------------------"
sudo sed -i'' 's/^OPENSSL_ALGO_ARG="-aes256"$/OPENSSL_ALGO_ARG=""/' /etc/mysqldump-secure.conf

echo "---------- CRON MODE ----------"
CMD="sudo mysqldump-secure --cron"

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE ----------"
CMD="sudo mysqldump-secure"

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE VERBOSE ----------"
CMD="sudo mysqldump-secure --verbose"

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


sudo sed -i'' 's/^OPENSSL_ALGO_ARG=""$/OPENSSL_ALGO_ARG="-aes256"/' /etc/mysqldump-secure.conf





echo
echo "----------------------------------------"
echo " 8.3.3 OPENSSL_ALGO_ARG=\"wrong\""
echo "----------------------------------------"
sudo sed -i'' 's/^OPENSSL_ALGO_ARG="-aes256"$/OPENSSL_ALGO_ARG="wrong"/' /etc/mysqldump-secure.conf

echo "---------- CRON MODE ----------"
CMD="sudo mysqldump-secure --cron"

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE ----------"
CMD="sudo mysqldump-secure"

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "---------- NORMAL MODE VERBOSE ----------"
CMD="sudo mysqldump-secure --verbose"

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi


sudo sed -i'' 's/^OPENSSL_ALGO_ARG="wrong"$/OPENSSL_ALGO_ARG="-aes256"/' /etc/mysqldump-secure.conf














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
