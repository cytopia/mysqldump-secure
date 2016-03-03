#!/usr/bin/env bash

ERROR=0

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. "${DIR}/config"



echo "##########################################################################################"
echo "#"
echo "#  6.  C H E C K I N G   L O G G I N G"
echo "#"
echo "##########################################################################################"

#
# TODO:
#

echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  6.1 \$LOG"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 6.1.1 #LOG=1"
echo "----------------------------------------"
sudo sed -i'' 's/^LOG=1/#LOG=1/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

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


sudo sed -i'' 's/^#LOG=1/LOG=1/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf





echo
echo "----------------------------------------"
echo " 6.1.2 LOG=2"
echo "----------------------------------------"
sudo sed -i'' 's/^LOG=1/LOG=2/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

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


sudo sed -i'' 's/^LOG=2/LOG=1/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 6.1.3 LOG=\"wrong\""
echo "----------------------------------------"
sudo sed -i'' 's/^LOG=1/LOG="wrong"/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

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


sudo sed -i'' 's/^LOG="wrong"/LOG=1/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf



echo
echo "----------------------------------------"
echo " 6.1.4 LOG=0"
echo "----------------------------------------"
sudo sed -i'' 's/^LOG=1/LOG=0/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

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


sudo sed -i'' 's/^LOG=0/LOG=1/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf




echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  6.2 \$LOG_CHMOD"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 6.2.1 #LOG_CHMOD=\"0600\""
echo "----------------------------------------"
sudo sed -i'' 's/^LOG_CHMOD="0600"/#LOG_CHMOD="0600"/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

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


sudo sed -i'' 's/^#LOG_CHMOD="0600"/LOG_CHMOD="0600"/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 6.2.2 LOG_CHMOD=\"0600a\""
echo "----------------------------------------"
sudo sed -i'' 's/^LOG_CHMOD="0600"/LOG_CHMOD="0600a"/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

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


sudo sed -i'' 's/^LOG_CHMOD="0600a"/LOG_CHMOD="0600"/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 6.2.3 LOG_CHMOD=\"wrong\""
echo "----------------------------------------"
sudo sed -i'' 's/^LOG_CHMOD="0600"/LOG_CHMOD="wrong"/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

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


sudo sed -i'' 's/^LOG_CHMOD="wrong"/LOG_CHMOD="0600"/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 6.2.4 LOG_CHMOD=\"\""
echo "----------------------------------------"
sudo sed -i'' 's/^LOG_CHMOD="0600"/LOG_CHMOD=""/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

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


sudo sed -i'' 's/^LOG_CHMOD=""/LOG_CHMOD="0600"/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf





echo
echo "----------------------------------------"
echo " 6.2.5 LOG_CHMOD="
echo "----------------------------------------"
sudo sed -i'' 's/^LOG_CHMOD="0600"/LOG_CHMOD=/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

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


sudo sed -i'' 's/^LOG_CHMOD=/LOG_CHMOD="0600"/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf





echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  6.3 \$LOGFILE"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 6.3.1 #LOGFILE=\"${_INSTALL_PREFIX}/var/log/mysqldump-secure.log\""
echo "----------------------------------------"
sudo sed -i'' 's/^LOGFILE=/#LOGFILE=/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

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


sudo sed -i'' 's/^#LOGFILE=/LOGFILE=/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 6.3.2 LOGFILE=\"/var/log/mysqldump-secure.log.wrong\""
echo "----------------------------------------"
sudo sed -i'' 's/mysqldump-secure.log/mysqldump-secure.log.wrong/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

echo "---------- CRON MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --cron"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo rm "/var/log/mysqldump-secure.log.wrong"

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo rm "/var/log/mysqldump-secure.log.wrong"

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo rm "/var/log/mysqldump-secure.log.wrong"


echo "---------- NORMAL MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo rm "/var/log/mysqldump-secure.log.wrong"

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo rm "/var/log/mysqldump-secure.log.wrong"

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo rm "/var/log/mysqldump-secure.log.wrong"

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo rm "/var/log/mysqldump-secure.log.wrong"


echo "---------- NORMAL MODE VERBOSE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --verbose"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo rm "/var/log/mysqldump-secure.log.wrong"

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo rm "/var/log/mysqldump-secure.log.wrong"

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo rm "/var/log/mysqldump-secure.log.wrong"

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo rm "/var/log/mysqldump-secure.log.wrong"


sudo sed -i'' 's/mysqldump-secure.log.wrong/mysqldump-secure.log/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf




echo
echo "----------------------------------------"
echo " 6.3.3 LOGFILE=\"/var/log/dir1/dir2/mysqldump-secure.log\""
echo "----------------------------------------"
sudo sed -i'' 's/mysqldump-secure.log/\/dir1\/dir2\/mysqldump-secure.log/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

echo "---------- CRON MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --cron"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo rm -rf "/var/log/dir1/"

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo rm -rf "/var/log/dir1/"

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo rm -rf "/var/log/dir1/"


echo "---------- NORMAL MODE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo rm -rf "/var/log/dir1/"

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo rm -rf "/var/log/dir1/"

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo rm -rf "/var/log/dir1/"

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo rm -rf "/var/log/dir1/"


echo "---------- NORMAL MODE VERBOSE ----------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --verbose"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo rm -rf "/var/log/dir1/"

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo rm -rf "/var/log/dir1/"

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo rm -rf "/var/log/dir1/"

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi
sudo rm -rf "/var/log/dir1/"


sudo sed -i'' 's/\/dir1\/dir2\/mysqldump-secure.log/mysqldump-secure.log/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf








echo
echo
if [ "$ERROR" = "0" ]; then
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ [06] SUCCESS @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
else
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@  [06] FAILED: ${ERROR} Errors   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
  echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
fi
exit $ERROR
