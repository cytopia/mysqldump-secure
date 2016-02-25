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
echo "#  4.  C H E C K I N G   M Y S Q L D U M P   S E T T I N G S"
echo "#"
echo "##########################################################################################"



echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  4.1 \$MYSQL_OPTS"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 4.1.1 #MYSQL_OPTS"
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/MYSQL_OPTS/#MYSQL_OPTS/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/

echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo sed -i'' 's/#MYSQL_OPTS/MYSQL_OPTS/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 4.1.2 MYSQL_OPTS=\"--opt2\""
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/ --opt/ --opt2/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/

echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"
sudo sed -i'' 's/ --opt2/ --opt/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 4.1.3 MYSQL_OPTS=\"--password\" (MYSQL_EVIL_OPTS)"
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/ --opt/ --password/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/

echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"
sudo sed -i'' 's/ --password/ --opt/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 4.1.4 MYSQL_OPTS=\"--password=foo\" (MYSQL_EVIL_OPTS)"
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/ --opt/ --password=foo/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/

echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"
sudo sed -i'' 's/ --password=foo/ --opt/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 4.1.5 MYSQL_OPTS=\"--defaults-extra-file\" (MYSQL_BAD_OPTS)"
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/ --opt/ --defaults-extra-file/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/

echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"
sudo sed -i'' 's/ --defaults-extra-file/ --opt/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 4.1.6 MYSQL_OPTS=\"--defaults-extra-file=bla\" (MYSQL_BAD_OPTS)"
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/ --opt/ --defaults-extra-file=bla/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/

echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"
sudo sed -i'' 's/ --defaults-extra-file=bla/ --opt/' /etc/mysqldump-secure.conf




echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  4.2 \$IGNORE"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 4.2.1 #IGNORE=\"information_schema performance_schema\" (dumping performance_schema, which is a virtual db and requires --skip-events)"
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^IGNORE/#IGNORE/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/

echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"
sudo sed -i'' 's/^#IGNORE/IGNORE/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 4.2.2 IGNORE=\"\" (dumping performance_schema, which is a virtual db and requires --skip-events)"
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/IGNORE="information_schema performance_schema"/IGNORE=""/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/

echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"
sudo sed -i'' 's/IGNORE=""/IGNORE="information_schema performance_schema"/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 4.2.3 IGNORE= (dumping performance_schema, which is a virtual db and requires --skip-events)"
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/IGNORE="information_schema performance_schema"/IGNORE=/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/

echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"
sudo sed -i'' 's/IGNORE=/IGNORE="information_schema performance_schema"/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 4.2.4 IGNORE=\"notfound performance_schema\""
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/IGNORE="information_schema performance_schema"/IGNORE="notfound performance_schema"/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/

echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo sed -i'' 's/IGNORE="notfound performance_schema"/IGNORE="information_schema performance_schema"/' /etc/mysqldump-secure.conf



echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  4.3 \$REQUIRE"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 4.3.1 #REQUIRE=\"mysql\""
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^REQUIRE/#REQUIRE/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/

echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo sed -i'' 's/^#REQUIRE/REQUIRE/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 4.3.2 REQUIRE=\"\""
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/REQUIRE="mysql"/REQUIRE=""/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/

echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo sed -i'' 's/REQUIRE=""/REQUIRE="mysql"/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 4.3.3 REQUIRE="
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/REQUIRE="mysql"/REQUIRE=/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/

echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo sed -i'' 's/REQUIRE=/REQUIRE="mysql"/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 4.3.4 REQUIRE=\"notfound\""
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/REQUIRE="mysql"/REQUIRE="notfound"/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo

echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"
sudo sed -i'' 's/REQUIRE="notfound"/REQUIRE="mysql"/' /etc/mysqldump-secure.conf




echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  4.4 \$CONSISTENT_DUMP"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 4.4.1 #CONSISTENT_DUMP=1"
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^CONSISTENT_DUMP=1/#CONSISTENT_DUMP=1/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/

echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo sed -i'' 's/^#CONSISTENT_DUMP=1/CONSISTENT_DUMP=1/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 4.4.2 CONSISTENT_DUMP=2"
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^CONSISTENT_DUMP=1/CONSISTENT_DUMP=2/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/

echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"
sudo sed -i'' 's/^CONSISTENT_DUMP=2/CONSISTENT_DUMP=1/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 4.4.3 CONSISTENT_DUMP=0"
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^CONSISTENT_DUMP=1/CONSISTENT_DUMP=0/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/

echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo sed -i'' 's/^CONSISTENT_DUMP=0/CONSISTENT_DUMP=1/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 4.4.4 CONSISTENT_DUMP=\"wrong\""
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^CONSISTENT_DUMP=1/CONSISTENT_DUMP="wrong"/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/

echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"
sudo sed -i'' 's/^CONSISTENT_DUMP="wrong"/CONSISTENT_DUMP=1/' /etc/mysqldump-secure.conf






echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  4.5 \$IGNORE_CONSISTENT_DUMP_WARNINGS"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 4.5.1 #IGNORE_CONSISTENT_DUMP_WARNINGS=1"
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^IGNORE_CONSISTENT_DUMP_WARNINGS=1/#IGNORE_CONSISTENT_DUMP_WARNINGS=1/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/

echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo sed -i'' 's/^#IGNORE_CONSISTENT_DUMP_WARNINGS=1/IGNORE_CONSISTENT_DUMP_WARNINGS=1/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 4.5.2 IGNORE_CONSISTENT_DUMP_WARNINGS=2"
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^IGNORE_CONSISTENT_DUMP_WARNINGS=1/IGNORE_CONSISTENT_DUMP_WARNINGS=2/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/

echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"
sudo sed -i'' 's/^IGNORE_CONSISTENT_DUMP_WARNINGS=2/IGNORE_CONSISTENT_DUMP_WARNINGS=1/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 4.5.3 IGNORE_CONSISTENT_DUMP_WARNINGS=0"
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^IGNORE_CONSISTENT_DUMP_WARNINGS=1/IGNORE_CONSISTENT_DUMP_WARNINGS=0/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/

echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo sed -i'' 's/^IGNORE_CONSISTENT_DUMP_WARNINGS=0/IGNORE_CONSISTENT_DUMP_WARNINGS=1/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 4.5.4 IGNORE_CONSISTENT_DUMP_WARNINGS=\"wrong\""
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^IGNORE_CONSISTENT_DUMP_WARNINGS=1/IGNORE_CONSISTENT_DUMP_WARNINGS="wrong"/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/

echo
echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"
sudo sed -i'' 's/^IGNORE_CONSISTENT_DUMP_WARNINGS="wrong"/IGNORE_CONSISTENT_DUMP_WARNINGS=1/' /etc/mysqldump-secure.conf



echo
echo
echo "${txtblu}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
echo "${txtblu}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   END OF CHECK   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
echo "${txtblu}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
exit $ERROR
