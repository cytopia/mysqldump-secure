#!/bin/sh

ERROR=0


txtgrn=$(tput setaf 2) # Green
txtylw=$(tput setaf 3) # Yellow
txtblu=$(tput setaf 4) # Blue
txtpur=$(tput setaf 5) # Purple
txtcyn=$(tput setaf 6) # Cyan
txtwht=$(tput setaf 7) # White
txtrst=$(tput sgr0) # Text reset.


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
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^MYSQL_CNF_FILE=/#MYSQL_CNF_FILE=/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo

echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"
sudo sed -i'' 's/^#MYSQL_CNF_FILE=/MYSQL_CNF_FILE=/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 3.1.2 MYSQL_CNF_FILE=\"/etc/mysqldump-secure.cnf2\""
echo "----------------------------------------"
echo
echo "b) MYSQL_CNF_FILE=\"/etc/mysqldump-secure.cnf2\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/mysqldump-secure.cnf/mysqldump-secure.cnf2/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/

echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"
sudo sed -i'' 's/mysqldump-secure.cnf2/mysqldump-secure.cnf/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 3.1.3 MYSQL_CNF_FILE=\"\""
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/MYSQL_CNF_FILE="\${_INSTALL_PREFIX}\/etc\/mysqldump-secure.cnf"/MYSQL_CNF_FILE=""/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/

echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"
sudo sed -i'' 's/MYSQL_CNF_FILE=""/MYSQL_CNF_FILE="\${_INSTALL_PREFIX}\/etc\/mysqldump-secure.cnf"/' /etc/mysqldump-secure.conf



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
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/MYSQL_SSL_ENABLE/#MYSQL_SSL_ENABLE/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo

echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"
sudo sed -i'' 's/#MYSQL_SSL_ENABLE/MYSQL_SSL_ENABLE/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 3.2.2 MYSQL_SSL_ENABLE=2"
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/MYSQL_SSL_ENABLE=1/MYSQL_SSL_ENABLE=2/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/

echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"
sudo sed -i'' 's/MYSQL_SSL_ENABLE=2/MYSQL_SSL_ENABLE=1/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 3.2.3 MYSQL_SSL_ENABLE="
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/MYSQL_SSL_ENABLE=1/MYSQL_SSL_ENABLE=/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/

echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"
sudo sed -i'' 's/MYSQL_SSL_ENABLE=/MYSQL_SSL_ENABLE=1/' /etc/mysqldump-secure.conf



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
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/MYSQL_SSL_CA_PEM/#MYSQL_SSL_CA_PEM/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/

echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"
sudo sed -i'' 's/#MYSQL_SSL_CA_PEM/MYSQL_SSL_CA_PEM/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 3.3.2 ca.pem.notfound"
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/ca.pem/ca.pem.notfound/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo

echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"
sudo sed -i'' 's/ca.pem.notfound/ca.pem/' /etc/mysqldump-secure.conf

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
echo "${txtblu}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
echo "${txtblu}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   END OF CHECK   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
echo "${txtblu}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
exit $ERROR
