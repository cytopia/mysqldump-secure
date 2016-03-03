#!/usr/bin/env bash

ERROR=0

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. "${DIR}/config"




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
sudo sed -i'' 's/^MYSQL_OPTS=/#MYSQL_OPTS=/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

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


sudo sed -i'' 's/^#MYSQL_OPTS/MYSQL_OPTS/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 4.1.2 MYSQL_OPTS=\"--compress2\""
echo "----------------------------------------"
sudo sed -i'' 's/ --compress/ --compress2/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

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


sudo sed -i'' 's/ --compress2/ --compress/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 4.1.3 MYSQL_OPTS=\"--password\" (MYSQL_EVIL_OPTS)"
echo "----------------------------------------"
sudo sed -i'' 's/ --compress/ --password/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

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


sudo sed -i'' 's/ --password/ --compress/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 4.1.4 MYSQL_OPTS=\"--password=foo\" (MYSQL_EVIL_OPTS)"
echo "----------------------------------------"
sudo sed -i'' 's/ --compress/ --password=foo/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

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


sudo sed -i'' 's/ --password=foo/ --compress/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 4.1.5 MYSQL_OPTS=\"--defaults-extra-file\" (MYSQL_BAD_OPTS)"
echo "----------------------------------------"
sudo sed -i'' 's/ --compress/ --defaults-extra-file/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

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


sudo sed -i'' 's/ --defaults-extra-file/ --compress/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 4.1.6 MYSQL_OPTS=\"--defaults-extra-file=bla\" (MYSQL_BAD_OPTS)"
echo "----------------------------------------"
sudo sed -i'' 's/ --compress/ --defaults-extra-file=bla/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

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


sudo sed -i'' 's/ --defaults-extra-file=bla/ --compress/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf




echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  4.2 \$MYSQL_OPTS_QUICK_MIN_SIZE"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 4.2.1 #MYSQL_OPTS_QUICK_MIN_SIZE"
echo "----------------------------------------"
sudo sed -i'' 's/^MYSQL_OPTS_QUICK_MIN_SIZE/#MYSQL_OPTS_QUICK_MIN_SIZE/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

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


sudo sed -i'' 's/^#MYSQL_OPTS_QUICK_MIN_SIZE/MYSQL_OPTS_QUICK_MIN_SIZE/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 4.2.2 MYSQL_OPTS_QUICK_MIN_SIZE=200abc"
echo "----------------------------------------"
sudo sed -i'' 's/^MYSQL_OPTS_QUICK_MIN_SIZE=200/MYSQL_OPTS_QUICK_MIN_SIZE=200abc/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

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


sudo sed -i'' 's/^MYSQL_OPTS_QUICK_MIN_SIZE=200abc/MYSQL_OPTS_QUICK_MIN_SIZE=200/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 4.2.3 MYSQL_OPTS_QUICK_MIN_SIZE=0"
echo "----------------------------------------"
sudo sed -i'' 's/^MYSQL_OPTS_QUICK_MIN_SIZE=200/MYSQL_OPTS_QUICK_MIN_SIZE=0/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

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


sudo sed -i'' 's/^MYSQL_OPTS_QUICK_MIN_SIZE=0/MYSQL_OPTS_QUICK_MIN_SIZE=200/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf




echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  4.3 \$IGNORE"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 4.4.1 #IGNORE=\"information_schema performance_schema\" (dumping performance_schema, which is a virtual db and requires --skip-events)"
echo "----------------------------------------"
sudo sed -i'' 's/^IGNORE="information_schema performance_schema"/#IGNORE="information_schema performance_schema"/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

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


sudo sed -i'' 's/^#IGNORE="information_schema performance_schema"/IGNORE="information_schema performance_schema"/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 4.4.2 IGNORE=\"\" (dumping performance_schema, which is a virtual db and requires --skip-events)"
echo "----------------------------------------"
sudo sed -i'' 's/^IGNORE="information_schema performance_schema"/IGNORE=""/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

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


sudo sed -i'' 's/^IGNORE=""/IGNORE="information_schema performance_schema"/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 4.4.3 IGNORE= (dumping performance_schema, which is a virtual db and requires --skip-events)"
echo "----------------------------------------"
sudo sed -i'' 's/^IGNORE="information_schema performance_schema"/IGNORE=/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

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


sudo sed -i'' 's/^IGNORE=/IGNORE="information_schema performance_schema"/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 4.4.4 IGNORE=\"notfound performance_schema\""
echo "----------------------------------------"
sudo sed -i'' 's/^IGNORE="information_schema performance_schema"/IGNORE="notfound performance_schema"/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

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


sudo sed -i'' 's/^IGNORE="notfound performance_schema"/IGNORE="information_schema performance_schema"/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf




echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  4.4 \$REQUIRE"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 4.4.1 #REQUIRE=\"mysql\""
echo "----------------------------------------"
sudo sed -i'' 's/^REQUIRE="mysql"/#REQUIRE="mysql"/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

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


sudo sed -i'' 's/^#REQUIRE="mysql"/REQUIRE="mysql"/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 4.4.2 REQUIRE=\"\""
echo "----------------------------------------"
sudo sed -i'' 's/^REQUIRE="mysql"/REQUIRE=""/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

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


sudo sed -i'' 's/^REQUIRE=""/REQUIRE="mysql"/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 4.4.3 REQUIRE="
echo "----------------------------------------"
sudo sed -i'' 's/^REQUIRE="mysql"/REQUIRE=/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

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



sudo sed -i'' 's/^REQUIRE=/REQUIRE="mysql"/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 4.4.4 REQUIRE=\"notfound\""
echo "----------------------------------------"
sudo sed -i'' 's/^REQUIRE="mysql"/REQUIRE="notfound"/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

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


sudo sed -i'' 's/^REQUIRE="notfound"/REQUIRE="mysql"/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf







echo
echo
if [ "$ERROR" = "0" ]; then
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ [04] SUCCESS @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
else
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@  [04] FAILED: ${ERROR} Errors   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
fi
exit $ERROR
