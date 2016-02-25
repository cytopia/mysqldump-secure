#!/bin/sh

ERROR=0


echo "##########################################################################################"
echo "#"
echo "#  2.  C H E C K I N G   C O N F I G U R A T I O N   F I L E"
echo "#"
echo "##########################################################################################"






echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  2.4 (OPT) Logging"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 2.4.1 \$LOG"
echo "----------------------------------------"

echo
echo "a) #LOG=1"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^LOG=1/#LOG=1/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/^#LOG=1/LOG=1/' /etc/mysqldump-secure.conf

echo
echo "b) LOG=2"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^LOG=1/LOG=2/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/^LOG=2/LOG=1/' /etc/mysqldump-secure.conf

echo
echo "c) LOG=\"wrong\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^LOG=1/LOG="wrong"/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/^LOG="wrong"/LOG=1/' /etc/mysqldump-secure.conf



echo
echo "----------------------------------------"
echo " 2.4.2 \$LOG_CHMOD"
echo "----------------------------------------"

echo
echo "a) #LOG_CHMOD=\"0600\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^LOG_CHMOD/#LOG_CHMOD/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/^#LOG_CHMOD/LOG_CHMOD/' /etc/mysqldump-secure.conf

echo
echo "b) LOG_CHMOD=\"0600a\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^LOG_CHMOD="0600"/LOG_CHMOD="0600a"/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/LOG_CHMOD="0600a"/LOG_CHMOD="0600"/' /etc/mysqldump-secure.conf

echo
echo "c) LOG_CHMOD=\"abc\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^LOG_CHMOD="0600"/LOG_CHMOD="abc"/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/LOG_CHMOD="abc"/LOG_CHMOD="0600"/' /etc/mysqldump-secure.conf

echo
echo "d) LOG_CHMOD=\"\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^LOG_CHMOD="0600"/LOG_CHMOD=""/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/LOG_CHMOD=""/LOG_CHMOD="0600"/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 2.4.3 \$LOGFILE"
echo "----------------------------------------"

echo
echo "a) #LOGFILE=\"/var/log/mysqldump-secure.log\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^LOGFILE/#LOGFILE/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/^#LOGFILE/LOGFILE/' /etc/mysqldump-secure.conf

echo
echo "b) LOGFILE=\"/var/log/mysqldump-secure.log2\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/mysqldump-secure.log/mysqldump-secure.log2/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo rm /var/log/mysqldump-secure.log2
echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/mysqldump-secure.log2/mysqldump-secure.log/' /etc/mysqldump-secure.conf

echo
echo "c) LOGFILE=\"/var/log/dir1/dir2/mysqldump-secure.log\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/mysqldump-secure.log/\/dir1\/dir2\/mysqldump-secure.log/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo rm -rf /var/log/dir1/dir2/
echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/\/dir1\/dir2\/mysqldump-secure.log/mysqldump-secure.log/' /etc/mysqldump-secure.conf
sudo rm -rf /var/log/dir1/dir2/



echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  2.5 (OPT) Compression"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 2.5.1 \$COMPRESS"
echo "----------------------------------------"

echo
echo "a) #COMPRESS=1"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^COMPRESS=1/#COMPRESS=1/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/^#COMPRESS=1/COMPRESS=1/' /etc/mysqldump-secure.conf

echo
echo "b) COMPRESS=2"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^COMPRESS=1/COMPRESS=2/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/^COMPRESS=2/COMPRESS=1/' /etc/mysqldump-secure.conf

echo
echo "c) COMPRESS=\"wrong\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^COMPRESS=1/COMPRESS="wrong"/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/^COMPRESS="wrong"/COMPRESS=1/' /etc/mysqldump-secure.conf

echo
echo "d) COMPRESS=\"\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^COMPRESS=1/COMPRESS=""/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/^COMPRESS=""/COMPRESS=1/' /etc/mysqldump-secure.conf

echo
echo "e) COMPRESS="
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^COMPRESS=1/COMPRESS=/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/^COMPRESS=/COMPRESS=1/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 2.5.2 \$COMPRESS_BIN"
echo "----------------------------------------"

echo
echo "a) #COMPRESS_BIN=\"gzip\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^COMPRESS_BIN="gzip"$/#COMPRESS_BIN="gzip"/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/^#COMPRESS_BIN="gzip"$/COMPRESS_BIN="gzip"/' /etc/mysqldump-secure.conf

echo
echo "b) COMPRESS_BIN=\"\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^COMPRESS_BIN="gzip"$/COMPRESS_BIN=""/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/^COMPRESS_BIN=""$/COMPRESS_BIN="gzip"/' /etc/mysqldump-secure.conf

echo
echo "c) COMPRESS_BIN="
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^COMPRESS_BIN="gzip"$/COMPRESS_BIN=/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/^COMPRESS_BIN=$/COMPRESS_BIN="gzip"/' /etc/mysqldump-secure.conf

echo
echo "d) COMPRESS_BIN=\"wrong\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^COMPRESS_BIN="gzip"$/COMPRESS_BIN="wrong"/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/^COMPRESS_BIN="wrong"$/COMPRESS_BIN="gzip"/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 2.5.3 \$COMPRESS_ARG"
echo "----------------------------------------"

echo
echo "a) #COMPRESS_ARG=\"-9 --stdout\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^COMPRESS_ARG="-9 --stdout"$/#COMPRESS_ARG="-9 --stdout"/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/^#COMPRESS_ARG="-9 --stdout"$/COMPRESS_ARG="-9 --stdout"/' /etc/mysqldump-secure.conf

echo
echo "b) COMPRESS_ARG=\"\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^COMPRESS_ARG="-9 --stdout"$/COMPRESS_ARG=""/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/^COMPRESS_ARG=""$/COMPRESS_ARG="-9 --stdout"/' /etc/mysqldump-secure.conf

echo
echo "c) COMPRESS_ARG="
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^COMPRESS_ARG="-9 --stdout"$/COMPRESS_ARG=/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/^COMPRESS_ARG=$/COMPRESS_ARG="-9 --stdout"/' /etc/mysqldump-secure.conf

echo
echo "d) COMPRESS_ARG=\"wrong\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^COMPRESS_ARG="-9 --stdout"$/COMPRESS_ARG="wrong"/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && { echo "--> [FAIL] Unexpected OK"; ERROR=1; } || echo "--> [OK] Expected Error. Exit code: $?"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && { echo "--> [FAIL] Unexpected OK"; ERROR=1; } || echo "--> [OK] Expected Error. Exit code: $?"
sudo sed -i'' 's/^COMPRESS_ARG="wrong"$/COMPRESS_ARG="-9 --stdout"/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 2.5.4 \$COMPRESS_EXT"
echo "----------------------------------------"

echo
echo "a) #COMPRESS_EXT=\"gz\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^COMPRESS_EXT="gz"$/#COMPRESS_EXT="gz"/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/^#COMPRESS_EXT="gz"$/COMPRESS_EXT="gz"/' /etc/mysqldump-secure.conf

echo
echo "b) COMPRESS_EXT=\"\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^COMPRESS_EXT="gz"$/COMPRESS_EXT=""/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/^COMPRESS_EXT=""$/COMPRESS_EXT="gz"/' /etc/mysqldump-secure.conf

echo
echo "c) COMPRESS_EXT="
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^COMPRESS_EXT="gz"$/COMPRESS_EXT=/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/^COMPRESS_EXT=$/COMPRESS_EXT="gz"/' /etc/mysqldump-secure.conf

echo
echo "d) #COMPRESS_EXT=\"/www/test\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^COMPRESS_EXT="gz"$/COMPRESS_EXT="www\/test"/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/^COMPRESS_EXT="www\/test"$/COMPRESS_EXT="gz"/' /etc/mysqldump-secure.conf



echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  2.6 (OPT) Encryption"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 2.6.1 \$ENCRYPT"
echo "----------------------------------------"

echo
echo "a) #ENCRYPT=1"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^ENCRYPT=1$/#ENCRYPT=1/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/^#ENCRYPT=1$/ENCRYPT=1/' /etc/mysqldump-secure.conf


exit $ERROR
