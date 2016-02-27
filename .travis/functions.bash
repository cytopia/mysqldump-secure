#!/usr/bin/env bash

txtgrn=$(tput setaf 2) # Green
txtylw=$(tput setaf 3) # Yellow
txtblu=$(tput setaf 4) # Blue
txtpur=$(tput setaf 5) # Purple
txtcyn=$(tput setaf 6) # Cyan
txtwht=$(tput setaf 7) # White
txtrst=$(tput sgr0) # Text reset.

#
# @param  string  PASS|FAIL what is expected?
# @param  string  Command
# @return integer 0:OK | 1:FAI:
run_test() {
	mod="${1}"
	cmd="${@:2}"

	echo "${txtblu}--> Run test:${txtrst}"
	echo "\$ ${txtblu}${cmd}${txtrst}"
	eval "${cmd}"
	exit="$?"

	# Test must succeed
	if [ "${mod}" = "PASS" ]; then

		if [ "${exit}" != "0" ]; then
			echo "${txtpur}===> [FAIL]${txtrst}"
			echo "${txtpur}===> [FAIL] Unexpected exit code: ${exit}${txtrst}"
			echo "${txtpur}===> [FAIL]${txtrst}"
			echo
			return 1
		else
			echo "${txtgrn}===> [OK]${txtrst}"
			echo "${txtgrn}===> [OK] Success${txtrst}"
			echo "${txtgrn}===> [OK]${txtrst}"
			echo
		echo
			return 0
		fi

	# Test must fail
	elif [ "${mod}" = "FAIL" ]; then

		if [ "${exit}" = "0" ]; then
			echo "${txtpur}===> [FAIL]${txtrst}"
			echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"
			echo "${txtpur}===> [FAIL]${txtrst}"
			echo
			return 1
		else
			echo "${txtgrn}===> [OK]${txtrst}"
			echo "${txtgrn}===> [OK] Expected Error. Exit code: ${exit}${txtrst}"
			echo "${txtgrn}===> [OK]${txtrst}"
			echo
		echo
			return 0
		fi

	# Something went wrong
	else

		echo "${txtpur}===> [FAIL]${txtrst}"
		echo "${txtgrn}===> [FAIL] Invalid usage of 'run_test'${txtrst}"
		echo "${txtpur}===> [FAIL]${txtrst}"
		return 1

	fi

}

#
## Test against unset variables
# @param  string  Command
# @return integer 0:OK | 1:FAI:
var_test() {
	cmd="$@"

	echo "${txtblu}--> Unbound variable test:${txtrst}"
	echo "\$ ${txtblu}${cmd} | grep 'parameter not set'${txtrst}"
	unbound="$(eval "${cmd} 3>&2 2>&1 1>&3 > /dev/null | grep 'parameter not set'")"

	if [ "${unbound}" != "" ]; then
		echo "${txtpur}===> [FAIL]${txtrst}"
		echo "${txtpur}===> [FAIL] Unbound variable found.${txtrst}"
		echo "${txtpur}===> [FAIL]${txtrst}"
		echo "${txtpur}${unbound}${txtrst}"
		echo
		return 1
	else
		echo "${txtgrn}===> [OK]${txtrst}"
		echo "${txtgrn}===> [OK] No Unbound variables found.${txtrst}"
		echo "${txtgrn}===> [OK]${txtrst}"
		echo
		return 0
	fi
}

#
## Test against syntax errors
# @param  string  Command
# @return integer 0:OK | 1:FAI:
syn_test() {
	cmd="$@"

	echo "${txtblu}--> Syntax error test:${txtrst}"
	echo "\$ ${txtblu}${cmd} | grep -E '.*[0-9]*:.*: not found.*'${txtrst}"
	syntax="$(eval "${cmd} 3>&2 2>&1 1>&3 > /dev/null | grep -E '.*[0-9]*:.*: not found.*'")"

	if [ "${syntax}" != "" ]; then
		echo "${txtpur}===> [FAIL]${txtrst}"
		echo "${txtpur}===> [FAIL] Syntax error found.${txtrst}"
		echo "${txtpur}===> [FAIL]${txtrst}"
		echo "${txtpur}${syntax}${txtrst}"
		echo
		return 1
	else
		echo "${txtgrn}===> [OK]${txtrst}"
		echo "${txtgrn}===> [OK] No Syntax error found.${txtrst}"
		echo "${txtgrn}===> [OK]${txtrst}"
		echo
		return 0
	fi
}



