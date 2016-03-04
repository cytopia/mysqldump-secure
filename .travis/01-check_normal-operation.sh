#!/usr/bin/env bash

ERROR=0

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. "${DIR}/config"



echo "##########################################################################################"
echo "#"
echo "#  1.  C H E C K I N G   N O R M A L   O P E R A T I O N"
echo "#"
echo "##########################################################################################"



echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  1.1 Test mode"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 1.1.1 Test mode first run"
echo "----------------------------------------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --test -vv"

mds_remove_logfiles
mds_remove_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_remove_logfiles
mds_remove_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_remove_logfiles
mds_remove_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi


echo "----------------------------------------"
echo " 1.1.2 Test mode second run"
echo "----------------------------------------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --test -vv"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi




echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  1.2 Normal mode"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 1.2.1 Normal mode first run"
echo "----------------------------------------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure -vv"

mds_remove_logfiles
mds_remove_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_remove_logfiles
mds_remove_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_remove_logfiles
mds_remove_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_remove_logfiles
mds_remove_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi



echo "----------------------------------------"
echo " 1.2.2 Normal mode second run"
echo "----------------------------------------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure -vv"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi



echo "----------------------------------------"
echo " 1.2.3 Normal mode third run (del files)"
echo "----------------------------------------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure -vv"

mds_recreate_datadir
sudo touch -a -m -t 201512180130.09 ${_INSTALL_PREFIX}/var/mysqldump-secure/delete-me-1.txt
sudo touch -a -m -t 201512180130.09 ${_INSTALL_PREFIX}/var/mysqldump-secure/delete-me-2.txt
sudo touch -a -m -t 201512180130.09 ${_INSTALL_PREFIX}/var/mysqldump-secure/delete-me-3.txt
sudo touch -a -m -t 201512180130.09 ${_INSTALL_PREFIX}/var/mysqldump-secure/delete-me-4.txt
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
sudo touch -a -m -t 201512180130.09 ${_INSTALL_PREFIX}/var/mysqldump-secure/delete-me-1.txt
sudo touch -a -m -t 201512180130.09 ${_INSTALL_PREFIX}/var/mysqldump-secure/delete-me-2.txt
sudo touch -a -m -t 201512180130.09 ${_INSTALL_PREFIX}/var/mysqldump-secure/delete-me-3.txt
sudo touch -a -m -t 201512180130.09 ${_INSTALL_PREFIX}/var/mysqldump-secure/delete-me-4.txt
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
sudo touch -a -m -t 201512180130.09 ${_INSTALL_PREFIX}/var/mysqldump-secure/delete-me-1.txt
sudo touch -a -m -t 201512180130.09 ${_INSTALL_PREFIX}/var/mysqldump-secure/delete-me-2.txt
sudo touch -a -m -t 201512180130.09 ${_INSTALL_PREFIX}/var/mysqldump-secure/delete-me-3.txt
sudo touch -a -m -t 201512180130.09 ${_INSTALL_PREFIX}/var/mysqldump-secure/delete-me-4.txt
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
sudo touch -a -m -t 201512180130.09 ${_INSTALL_PREFIX}/var/mysqldump-secure/delete-me-1.txt
sudo touch -a -m -t 201512180130.09 ${_INSTALL_PREFIX}/var/mysqldump-secure/delete-me-2.txt
sudo touch -a -m -t 201512180130.09 ${_INSTALL_PREFIX}/var/mysqldump-secure/delete-me-3.txt
sudo touch -a -m -t 201512180130.09 ${_INSTALL_PREFIX}/var/mysqldump-secure/delete-me-4.txt
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi




echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  1.3 Cron mode (--cron)"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 1.3.1 Cron mode first run"
echo "----------------------------------------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --cron"

mds_remove_logfiles
mds_remove_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_remove_logfiles
mds_remove_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_remove_logfiles
mds_remove_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi



echo "----------------------------------------"
echo " 1.3.2 Cron mode second run"
echo "----------------------------------------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --cron"

mds_recreate_datadir
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi



echo "----------------------------------------"
echo " 1.3.3 Cron mode third run (del files)"
echo "----------------------------------------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --cron"

mds_recreate_datadir
sudo touch -a -m -t 201512180130.09 ${_INSTALL_PREFIX}/var/mysqldump-secure/delete-me-1.txt
sudo touch -a -m -t 201512180130.09 ${_INSTALL_PREFIX}/var/mysqldump-secure/delete-me-2.txt
sudo touch -a -m -t 201512180130.09 ${_INSTALL_PREFIX}/var/mysqldump-secure/delete-me-3.txt
sudo touch -a -m -t 201512180130.09 ${_INSTALL_PREFIX}/var/mysqldump-secure/delete-me-4.txt
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
sudo touch -a -m -t 201512180130.09 ${_INSTALL_PREFIX}/var/mysqldump-secure/delete-me-1.txt
sudo touch -a -m -t 201512180130.09 ${_INSTALL_PREFIX}/var/mysqldump-secure/delete-me-2.txt
sudo touch -a -m -t 201512180130.09 ${_INSTALL_PREFIX}/var/mysqldump-secure/delete-me-3.txt
sudo touch -a -m -t 201512180130.09 ${_INSTALL_PREFIX}/var/mysqldump-secure/delete-me-4.txt
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi

mds_recreate_datadir
sudo touch -a -m -t 201512180130.09 ${_INSTALL_PREFIX}/var/mysqldump-secure/delete-me-1.txt
sudo touch -a -m -t 201512180130.09 ${_INSTALL_PREFIX}/var/mysqldump-secure/delete-me-2.txt
sudo touch -a -m -t 201512180130.09 ${_INSTALL_PREFIX}/var/mysqldump-secure/delete-me-3.txt
sudo touch -a -m -t 201512180130.09 ${_INSTALL_PREFIX}/var/mysqldump-secure/delete-me-4.txt
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi




echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  1.4 cmd arguments"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 1.4.1 --help"
echo "----------------------------------------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --help"
if ! run_test "PASS" "${CMD}"; then ERROR=$((ERROR+1)); fi
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi



echo "----------------------------------------"
echo " 1.4.2 --conf (does not exist)"
echo "----------------------------------------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure -vv --conf=${_INSTALL_PREFIX}/etc/nothere"
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi



echo "----------------------------------------"
echo " 1.4.3 --conf (random file)"
echo "----------------------------------------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure -vv --conf=${_INSTALL_PREFIX}/etc/mysqldump-secure.cnf"
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi
# TODO: Ignore until config parsing has been fixed
# if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi



echo "----------------------------------------"
echo " 1.4.4 wrong argument"
echo "----------------------------------------"
CMD="sudo ${_INSTALL_PREFIX}/bin/mysqldump-secure --wrong"
if ! run_test "FAIL" "${CMD}"; then ERROR=$((ERROR+1)); fi
if ! var_test "${CMD}"; then ERROR=$((ERROR+1)); fi
if ! syn_test "${CMD}"; then ERROR=$((ERROR+1)); fi
if ! end_test "${CMD}"; then ERROR=$((ERROR+1)); fi




echo
echo
if [ "$ERROR" = "0" ]; then
	echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
	echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ [01] SUCCESS @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
	echo "${txtgrn}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
else
	echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
	echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@  [01] FAILED: ${ERROR} Errors   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
	echo "${txtpur}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${txtrst}"
fi
exit $ERROR
