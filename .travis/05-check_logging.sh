#!/usr/bin/env bash

ERROR=0

. "./.travis/functions.bash"





echo "##########################################################################################"
echo "#"
echo "#  5.  C H E C K I N G   L O G G I N G"
echo "#"
echo "##########################################################################################"



echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  5.1 \$LOG"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 5.1.1 #LOG=1"
echo "----------------------------------------"
sudo sed -i'' 's/^LOG=1/#LOG=1/' /etc/mysqldump-secure.conf

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


sudo sed -i'' 's/^#LOG=1/LOG=1/' /etc/mysqldump-secure.conf





echo
echo "----------------------------------------"
echo " 5.1.2 LOG=2"
echo "----------------------------------------"
sudo sed -i'' 's/^LOG=1/LOG=2/' /etc/mysqldump-secure.conf

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


sudo sed -i'' 's/^LOG=2/LOG=1/' /etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 5.1.3 LOG=\"wrong\""
echo "----------------------------------------"
sudo sed -i'' 's/^LOG=1/LOG="wrong"/' /etc/mysqldump-secure.conf

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


sudo sed -i'' 's/^LOG="wrong"/LOG=1/' /etc/mysqldump-secure.conf





echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  5.2 \$LOG_CHMOD"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 5.2.1 #LOG_CHMOD=\"0600\""
echo "----------------------------------------"
sudo sed -i'' 's/^LOG_CHMOD="0600"/#LOG_CHMOD="0600"/' /etc/mysqldump-secure.conf

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


sudo sed -i'' 's/^#LOG_CHMOD="0600"/LOG_CHMOD="0600"/' /etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 5.2.2 LOG_CHMOD=\"0600a\""
echo "----------------------------------------"
sudo sed -i'' 's/^LOG_CHMOD="0600"/LOG_CHMOD="0600a"/' /etc/mysqldump-secure.conf

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


sudo sed -i'' 's/^LOG_CHMOD="0600a"/LOG_CHMOD="0600"/' /etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 5.2.3 LOG_CHMOD=\"wrong\""
echo "----------------------------------------"
sudo sed -i'' 's/^LOG_CHMOD="0600"/LOG_CHMOD="wrong"/' /etc/mysqldump-secure.conf

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


sudo sed -i'' 's/^LOG_CHMOD="wrong"/LOG_CHMOD="0600"/' /etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 5.2.4 LOG_CHMOD=\"\""
echo "----------------------------------------"
sudo sed -i'' 's/^LOG_CHMOD="0600"/LOG_CHMOD=""/' /etc/mysqldump-secure.conf

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


sudo sed -i'' 's/^LOG_CHMOD=""/LOG_CHMOD="0600"/' /etc/mysqldump-secure.conf





echo
echo "----------------------------------------"
echo " 5.2.5 LOG_CHMOD="
echo "----------------------------------------"
sudo sed -i'' 's/^LOG_CHMOD="0600"/LOG_CHMOD=/' /etc/mysqldump-secure.conf

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


sudo sed -i'' 's/^LOG_CHMOD=/LOG_CHMOD="0600"/' /etc/mysqldump-secure.conf





echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  5.3 \$LOGFILE"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 5.3.1 #LOGFILE=\"/var/log/mysqldump-secure.log\""
echo "----------------------------------------"
sudo sed -i'' 's/^LOGFILE=/#LOGFILE=/' /etc/mysqldump-secure.conf

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


sudo sed -i'' 's/^#LOGFILE=/LOGFILE=/' /etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 5.3.2 LOGFILE=\"/var/log/mysqldump-secure.log.wrong\""
echo "----------------------------------------"
sudo sed -i'' 's/mysqldump-secure.log/mysqldump-secure.log.wrong/' /etc/mysqldump-secure.conf

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


sudo sed -i'' 's/mysqldump-secure.log.wrong/mysqldump-secure.log/' /etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 5.3.3 LOGFILE=\"/var/log/dir1/dir2/mysqldump-secure.log\""
echo "----------------------------------------"
sudo sed -i'' 's/mysqldump-secure.log/\/dir1\/dir2\/mysqldump-secure.log/' /etc/mysqldump-secure.conf

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


sudo sed -i'' 's/\/dir1\/dir2\/mysqldump-secure.log/mysqldump-secure.log/' /etc/mysqldump-secure.conf








echo
echo
if [ "$ERROR" = "0" ]; then
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ [05] SUCESS @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
else
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@  [05] FAILED: ${ERROR} Errors   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
fi
exit $ERROR
