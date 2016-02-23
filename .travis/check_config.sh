#!/bin/sh

ERROR=0


echo "################################################################################"
echo "#"
echo "#  2.  C H E C K I N G   C O N F I G U R A T I O N   F I L E"
echo "#"
echo "################################################################################"


echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  2.1 Output files/folders"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 2.1.1 \$DUMP_DIR_CHMOD"
echo "----------------------------------------"

echo
echo "a)"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/DUMP_DIR_CHMOD="0700"/#DUMP_DIR_CHMOD="0700"/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/#DUMP_DIR_CHMOD="0700"/DUMP_DIR_CHMOD="0700"/' /etc/mysqldump-secure.conf

echo
echo "b)"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/DUMP_DIR_CHMOD="0700"/DUMP_DIR_CHMOD="0700a"/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/DUMP_DIR_CHMOD="0700a"/DUMP_DIR_CHMOD="0700"/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 2.1.2 \$DUMP_FILE_CHMOD"
echo "----------------------------------------"

echo
echo "a)"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/DUMP_FILE_CHMOD="0400"/#DUMP_FILE_CHMOD="0400"/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/#DUMP_FILE_CHMOD="0400"/DUMP_FILE_CHMOD="0400"/' /etc/mysqldump-secure.conf

echo
echo "b)"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/DUMP_FILE_CHMOD="0400"/DUMP_FILE_CHMOD="0400a"/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/DUMP_FILE_CHMOD="0400a"/DUMP_FILE_CHMOD="0400"/' /etc/mysqldump-secure.conf



echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  2.2 MySQL Connection settings"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 2.2.1 \$MYSQL_CNF_FILE"
echo "----------------------------------------"

echo
echo "a)"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/MYSQL_CNF_FILE/#MYSQL_CNF_FILE/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && { echo "--> [FAIL] Unexpected OK"; ERROR=1; } || echo "--> [OK] Expected Error. Exit code: $?"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && { echo "--> [FAIL] Unexpected OK"; ERROR=1; } || echo "--> [OK] Expected Error. Exit code: $?"
sudo sed -i'' 's/#MYSQL_CNF_FILE/MYSQL_CNF_FILE/' /etc/mysqldump-secure.conf

echo
echo "b)"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/MYSQL_CNF_FILE="${_/MYSQL_CNF_FILE="${__/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && { echo "--> [FAIL] Unexpected OK"; ERROR=1; } || echo "--> [OK] Expected Error. Exit code: $?"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && { echo "--> [FAIL] Unexpected OK"; ERROR=1; } || echo "--> [OK] Expected Error. Exit code: $?"
sudo sed -i'' 's/MYSQL_CNF_FILE="${__/MYSQL_CNF_FILE="${_/' /etc/mysqldump-secure.conf

echo
echo "c)"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/mysqldump-secure.cnf/mysqldump-secure.cnf2/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && { echo "--> [FAIL] Unexpected OK"; ERROR=1; } || echo "--> [OK] Expected Error. Exit code: $?"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && { echo "--> [FAIL] Unexpected OK"; ERROR=1; } || echo "--> [OK] Expected Error. Exit code: $?"
sudo sed -i'' 's/mysqldump-secure.cnf2/mysqldump-secure.cnf/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 2.2.2 \$MYSQL_SSL_ENABLE"
echo "----------------------------------------"

echo
echo "a)"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/MYSQL_SSL_ENABLE/#MYSQL_SSL_ENABLE/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && { echo "--> [FAIL] Unexpected OK"; ERROR=1; } || echo "--> [OK] Expected Error. Exit code: $?"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && { echo "--> [FAIL] Unexpected OK"; ERROR=1; } || echo "--> [OK] Expected Error. Exit code: $?"
sudo sed -i'' 's/#MYSQL_SSL_ENABLE/MYSQL_SSL_ENABLE/' /etc/mysqldump-secure.conf

echo
echo "b)"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/MYSQL_SSL_ENABLE=1/MYSQL_SSL_ENABLE=2/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/MYSQL_SSL_ENABLE=2/MYSQL_SSL_ENABLE=1/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 2.2.3 \$MYSQL_SSL_CA_PEM"
echo "----------------------------------------"

echo
echo "a)"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/MYSQL_SSL_CA_PEM/#MYSQL_SSL_CA_PEM/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && { echo "--> [FAIL] Unexpected OK"; ERROR=1; } || echo "--> [OK] Expected Error. Exit code: $?"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && { echo "--> [FAIL] Unexpected OK"; ERROR=1; } || echo "--> [OK] Expected Error. Exit code: $?"
sudo sed -i'' 's/#MYSQL_SSL_CA_PEM/MYSQL_SSL_CA_PEM/' /etc/mysqldump-secure.conf

echo
echo "b)"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/MYSQL_SSL_ENABLE=1/MYSQL_SSL_ENABLE=2/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && { echo "--> [FAIL] Unexpected OK"; ERROR=1; } || echo "--> [OK] Expected Error. Exit code: $?"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && { echo "--> [FAIL] Unexpected OK. Exit code: $?"; ERROR=1; } || echo "--> [OK] Expected Error. Exit code: $?"
sudo sed -i'' 's/MYSQL_SSL_ENABLE=2/MYSQL_SSL_ENABLE=1/' /etc/mysqldump-secure.conf

  # 9.f [ABORT] $MYSQL_SSL_CLIENT_CERT_PEM
  # TODO:
  #- echo "---------- \$MYSQL_SSL_CLIENT_CERT_PEM ----------"
  #- sudo sed -i'' 's/MYSQL_SSL_CLIENT_CERT_PEM/#MYSQL_SSL_CLIENT_CERT_PEM/' /etc/mysqldump-secure.conf
  #- sudo mysqldump-secure --cron
  #- sudo mysqldump-secure
  #- sudo sed -i'' 's/#MYSQL_SSL_CLIENT_CERT_PEM/MYSQL_SSL_CLIENT_CERT_PEM/' /etc/mysqldump-secure.conf

  #- echo "---------- \$MYSQL_SSL_CLIENT_CERT_PEM ----------"
  #- sudo sed -i'' 's/client-cert.pem/client-cert.pem2/' /etc/mysqldump-secure.conf
  #- sudo mysqldump-secure --cron
  #- sudo mysqldump-secure
  #- sudo sed -i'' 's/client-cert.pem2/client-cert.pem/' /etc/mysqldump-secure.conf


  # 9.g [ABORT] $MYSQL_SSL_CLIENT_KEY_PEM
  # TODO:
  #- echo "---------- \$MYSQL_SSL_CLIENT_KEY_PEM ----------"
  #- sudo sed -i'' 's/MYSQL_SSL_CLIENT_KEY_PEM/#MYSQL_SSL_CLIENT_KEY_PEM/' /etc/mysqldump-secure.conf
  #- sudo mysqldump-secure --cron
  #- sudo mysqldump-secure
  #- sudo sed -i'' 's/#MYSQL_SSL_CLIENT_KEY_PEM/MYSQL_SSL_CLIENT_KEY_PEM/' /etc/mysqldump-secure.conf

  #- echo "---------- \$MYSQL_SSL_CLIENT_KEY_PEM ----------"
  #- sudo sed -i'' 's/client-key.pem/client-key.pem2/' /etc/mysqldump-secure.conf
  #- sudo mysqldump-secure --cron
  #- sudo mysqldump-secure
  #- sudo sed -i'' 's/client-key.pem2/client-key.pem/' /etc/mysqldump-secure.conf



echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  2.3 MySQL Dump settings"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 2.3.1 \$MYSQL_OPTS"
echo "----------------------------------------"

echo
echo "a)"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/MYSQL_OPTS/#MYSQL_OPTS/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/#MYSQL_OPTS/MYSQL_OPTS/' /etc/mysqldump-secure.conf

echo
echo "b)"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/ --opt/ --opt2/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && { echo "--> [FAIL] Unexpected OK. Exit code: $?"; ERROR=1; } || echo "--> [OK] Expected Error. Exit code: $?"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && { echo "--> [FAIL] Unexpected OK. Exit code: $?"; ERROR=1; } || echo "--> [OK] Expected Error. Exit code: $?"
sudo sed -i'' 's/ --opt2/ --opt/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 2.3.2 \$IGNORE"
echo "----------------------------------------"

echo
echo "a)"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^IGNORE/#IGNORE/' /etc/mysqldump-secure.conf
sudo mysqldump-secure --cron
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo mysqldump-secure
sudo sed -i'' 's/^#IGNORE/IGNORE/' /etc/mysqldump-secure.conf








exit $ERROR
