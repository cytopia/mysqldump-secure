#!/usr/bin/env bash

ERROR=0

. "./.travis/functions.bash"




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
sudo sed -i'' 's/^COMPRESS=1/#COMPRESS=1/' /etc/mysqldump-secure.conf

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


sudo sed -i'' 's/^#COMPRESS=1/COMPRESS=1/' /etc/mysqldump-secure.conf



echo
echo "----------------------------------------"
echo " 7.1.2 COMPRESS=2"
echo "----------------------------------------"
sudo sed -i'' 's/^COMPRESS=1/COMPRESS=2/' /etc/mysqldump-secure.conf


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


sudo sed -i'' 's/^COMPRESS=2/COMPRESS=1/' /etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 7.1.3 COMPRESS=\"wrong\""
echo "----------------------------------------"
sudo sed -i'' 's/^COMPRESS=1/COMPRESS="wrong"/' /etc/mysqldump-secure.conf


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


sudo sed -i'' 's/^COMPRESS="wrong"/COMPRESS=1/' /etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 7.1.4 COMPRESS=\"\""
echo "----------------------------------------"
sudo sed -i'' 's/^COMPRESS=1/COMPRESS=""/' /etc/mysqldump-secure.conf


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


sudo sed -i'' 's/^COMPRESS=""/COMPRESS=1/' /etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 7.1.5 COMPRESS=0"
echo "----------------------------------------"
sudo sed -i'' 's/^COMPRESS=1/COMPRESS=0/' /etc/mysqldump-secure.conf


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


sudo sed -i'' 's/^COMPRESS=0/COMPRESS=1/' /etc/mysqldump-secure.conf







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
sudo sed -i'' 's/^COMPRESS_BIN="gzip"$/#COMPRESS_BIN="gzip"/' /etc/mysqldump-secure.conf


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


sudo sed -i'' 's/^#COMPRESS_BIN="gzip"$/COMPRESS_BIN="gzip"/' /etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 7.2.2 COMPRESS_BIN=\"\""
echo "----------------------------------------"
sudo sed -i'' 's/^COMPRESS_BIN="gzip"$/COMPRESS_BIN=""/' /etc/mysqldump-secure.conf

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


sudo sed -i'' 's/^COMPRESS_BIN=""$/COMPRESS_BIN="gzip"/' /etc/mysqldump-secure.conf





echo
echo "----------------------------------------"
echo " 7.2.3 COMPRESS_BIN=\"wrong\""
echo "----------------------------------------"

sudo sed -i'' 's/^COMPRESS_BIN="gzip"$/COMPRESS_BIN="wrong"/' /etc/mysqldump-secure.conf


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


sudo sed -i'' 's/^COMPRESS_BIN="wrong"$/COMPRESS_BIN="gzip"/' /etc/mysqldump-secure.conf






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
sudo sed -i'' 's/^COMPRESS_ARG="-9 --stdout"$/#COMPRESS_ARG="-9 --stdout"/' /etc/mysqldump-secure.conf

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


sudo sed -i'' 's/^#COMPRESS_ARG="-9 --stdout"$/COMPRESS_ARG="-9 --stdout"/' /etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 7.3.2 COMPRESS_ARG=\"\""
echo "----------------------------------------"
sudo sed -i'' 's/^COMPRESS_ARG="-9 --stdout"$/COMPRESS_ARG=""/' /etc/mysqldump-secure.conf

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


sudo sed -i'' 's/^COMPRESS_ARG=""$/COMPRESS_ARG="-9 --stdout"/' /etc/mysqldump-secure.conf






echo
echo "----------------------------------------"
echo " 7.3.3 COMPRESS_ARG=\"wrong\" (encryption: on)"
echo "----------------------------------------"
sudo sed -i'' 's/^COMPRESS_ARG="-9 --stdout"$/COMPRESS_ARG="wrong"/' /etc/mysqldump-secure.conf

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


sudo sed -i'' 's/^COMPRESS_ARG="wrong"$/COMPRESS_ARG="-9 --stdout"/' /etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 7.3.4 COMPRESS_ARG=\"wrong\" (encryption: off)"
echo "----------------------------------------"
sudo sed -i'' 's/^COMPRESS_ARG="-9 --stdout"$/COMPRESS_ARG="wrong"/' /etc/mysqldump-secure.conf
sudo sed -i'' 's/^ENCRYPT=1$/ENCRYPT=0/' /etc/mysqldump-secure.conf

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


sudo sed -i'' 's/^ENCRYPT=0$/ENCRYPT=1/' /etc/mysqldump-secure.conf
sudo sed -i'' 's/^COMPRESS_ARG="wrong"$/COMPRESS_ARG="-9 --stdout"/' /etc/mysqldump-secure.conf








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
sudo sed -i'' 's/^COMPRESS_EXT="gz"$/#COMPRESS_EXT="gz"/' /etc/mysqldump-secure.conf

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


sudo sed -i'' 's/^#COMPRESS_EXT="gz"$/COMPRESS_EXT="gz"/' /etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 7.4.2 COMPRESS_EXT=\"\""
echo "----------------------------------------"
sudo sed -i'' 's/^COMPRESS_EXT="gz"$/COMPRESS_EXT=""/' /etc/mysqldump-secure.conf

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


sudo sed -i'' 's/^COMPRESS_EXT=""$/COMPRESS_EXT="gz"/' /etc/mysqldump-secure.conf







echo
echo "----------------------------------------"
echo " 7.4.3 COMPRESS_EXT=\"/www/test\" (encryption: on)"
echo "----------------------------------------"
sudo sed -i'' 's/^COMPRESS_EXT="gz"$/COMPRESS_EXT="www\/test"/' /etc/mysqldump-secure.conf


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


sudo sed -i'' 's/^COMPRESS_EXT="www\/test"$/COMPRESS_EXT="gz"/' /etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 7.4.4 COMPRESS_EXT=\"/www/test\" (encryption: off)"
echo "----------------------------------------"
sudo sed -i'' 's/^COMPRESS_EXT="gz"$/COMPRESS_EXT="www\/test"/' /etc/mysqldump-secure.conf
sudo sed -i'' 's/^ENCRYPT=1$/ENCRYPT=0/' /etc/mysqldump-secure.conf


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


sudo sed -i'' 's/^ENCRYPT=0$/ENCRYPT=1/' /etc/mysqldump-secure.conf
sudo sed -i'' 's/^COMPRESS_EXT="www\/test"$/COMPRESS_EXT="gz"/' /etc/mysqldump-secure.conf














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
