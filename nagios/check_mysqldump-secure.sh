#!/bin/sh
#
# @author    Patrick Plocke <patrick@plocke.de>
# @gpg key   0x28BF179F
# @date      2015-06-22-
# @licencse  MIT http://opensource.org/licenses/MIT
# @version   v0.1



################################################################################
#
# Global Defines
#
################################################################################
INFO_AUTHOR="Patrick Plocke <patrick@plocke.de>"
INFO_GPGKEY="0x28BF179F"
INFO_DATE="2015-06-22"
INFO_LICENSE="MIT"
INFO_VERSION="v0.1"

# Check for performance data:
# http://nagios.sourceforge.net/docs/3_0/pluginapi.html
# Nagios error codes
EXIT_OK=0
EXIT_WARN=1
EXIT_ERR=2
EXIT_UNKNOWN=3



################################################################################
#
# Helper Functions
#
################################################################################


############################################################
# Math Functions
############################################################

# Test if given value is an integer
# @param  mixed		input
# @return status	0: is int | 1: not int
isint() {
	printf '%d' "$1" >/dev/null 2>&1 && return 0 || return 1;
}

############################################################
# Date Functions
############################################################

# Date that can differentiate between linux,bsd and osx
# @param format (unix date)
# @param (optional) timestamp in seconds or now
_date() {
	# TODO: differentiate between linux, osx and bsd
	if [ $# -eq 1 ]; then
		date "$1"
	else
		date -r ${2} "${1}"
	fi
}

# Get hours:min between two timestamps
# @param int unix timestamp
# @param int unix timestamp
# @return string
_time_ago() {
	timestamp1="${1}"
	timestamp2="${2}"

	sec_due=$( expr $timestamp1 - $timestamp2 )
	min_due=$( expr $sec_due / 60 )
	min_due=$( expr $min_due % 60 )
	hrs_due=$( expr $sec_due / 3600 )

	echo "${hrs_due}h ${min_due}m"
}

# Return system independent current timestamp
_timestamp_now() {
	echo "$(_date +%s)"
}


############################################################
# Misc Functions
############################################################

# Get ini-file value by key
ini_get() {
	str="${1}"
	key="${2}"

	# TODO: Only replace first occurance of '='
	val="$(echo "${str}" | grep -E "^\s*${key}\s*=" | sed 's/=/ /' | awk '{ for (i=2; i<=NF; i++) print $i }')"
	echo "${val}"
}



################################################################################
#
# Program Functions
#
################################################################################

usage() {
	printf "Usage: %s -i<int> [-e] [-c] [-l] [-d<int>] -f<path>\n" "$(basename $0)"
	printf "OR     %s --help\n" "$(basename $0)"
	printf "OR     %s --version\n" "$(basename $0)"
}

help() {
	usage
	printf "\n"
	printf "   -i         Minimum backup interval in hours that must be met.\n"
	printf "              If database dump cycle is longer, program will\n"
	printf "              exit with nagios error code.\n"
	printf "              Must be positive integer.\n\n"
	printf "   -e         (optional) Encryption must be enabled, otherwise\n"
	printf "              program will exit with nagios error code.\n\n"
	printf "   -c         (optional) Compression must be enabled, otherwise\n"
	printf "              program will exit with nagios error code.\n\n"
	printf "   -l         (optional) Logging must be enabled, otherwise\n"
	printf "              program will exit with nagios error code.\n\n"
	printf "   -d         (optional) Minimum tmpwatch deletion interval in hours\n"
	printf "              that must be met. If deletion is disabled\n"
	printf "              or deletion cycle is longer, program will\n"
	printf "              exit with nagios error code.\n"
	printf "              Must be positive integer.\n\n"
	printf "   -f         Full path to mysqldump-secure.nagios.log.\n\n"
	printf "   --help     Display this help screen.\n\n"
	printf "   --version  Display version and author information.\n\n"

	printf "Examples\n"
	printf "%s\n" "----------------------------------------------------------------------"
	printf "  %s -i24 -f/var/log/mysqldump-secure.nagios.log\n" "$0"
	printf "      Checks if backups are created at least every 24 hours.\n"
	printf "      Will warn if either encryption, compression or tmpwatch\n"
	printf "      deletion is enabled.\n\n"
	printf "  %s -i24 -e -d720 -f/var/log/mysqldump-secure.nagios.log\n" "$0"
	printf "      Checks if backups are created at least every 24 hours.\n"
	printf "      Will warn if compression is enabled.\n"
	printf "      Will return an error if encryption is disabled.\n"
	printf "      Will return an error if tmpwatch deletion cycle is longer\n"
	printf "      than 720 hours.\n"
}

version() {
	printf "Version: %s (%s)\n" "${INFO_VERSION}" "${INFO_DATE}"
	printf "Author:  %s (%s)\n" "${INFO_AUTHOR}" "${INFO_GPGKEY}"
	printf "License: %s\n" "${INFO_LICENSE}"
}



################################################################################
#
# Nagios Functions
#
################################################################################

# Check backup due date
#
# @param int	$1		Hours agao
# @param int	$2		Timestamp of last backup
# @return int			Status: 0=OK | >0=ERR
check_backup_due_date() {
	max_hours_ago=$1
	timestamp_actual=$2
	timestamp_should=$(expr "$(_timestamp_now)" - $max_hours_ago \* 3600)

	#date_actual=$(_date "+%Y-%m-%d %H:%M" $timestamp_actual)
	#date_should=$(_date "+%Y-%m-%d %H:%M" $timestamp_should)

	if [ $timestamp_should -gt $timestamp_actual ]; then
		time_due=$(_time_ago $timestamp_should $timestamp_actual)

		#printf "[Error] Last backup %s late. Expected: %s. Actual backup was: %s\n" "$time_due" "$date_should" "$date_actual"
		printf "[Err]: Last backup %s late.\n" "$time_due"
		return $EXIT_ERR
	fi

	return $EXIT_OK
}


check_tmpwatch_del_date() {
	return 0
}


################################################################################
#
# Parameter Check
#
################################################################################
if [ $# -lt 1 ] || [ $# -gt 6 ]; then
	printf "Invalid number of arguments.\n"
	usage
	exit $EXIT_UNKNOWN
fi

if [ $# -eq 1 ]; then
	if [ "$1" = "--help" ]; then
		help
		exit $EXIT_OK
	elif [ "$1" = "--version" ]; then
		version
		exit $EXIT_OK
	else
		printf "Invalid argument: \"%s\"\n" "${1}"
		usage
		exit $EXIT_UNKNOWN
	fi
fi

for arg in "$@"; do
	case "${arg}" in
		-i[0-9]*)
			CHECK_TIME=$(echo "${arg}" | sed 's/-i//')
			if ! isint "${CHECK_TIME}" 2> /dev/null 2>&1 ; then
				echo "Arg \"-i\": time must be an integer."
				usage
				exit $EXIT_UNKNOWN
			else
				if [ $CHECK_TIME -le 0 ]; then
					echo "Arg \"-i\": time must be greater than 0."
					usage
					exit $EXIT_UNKNOWN
				fi
			fi
			;;
		-d[0-9]*)
			CHECK_DELETION=$(echo "${arg}" | sed 's/-d//')
			if [ $CHECK_DELETION -le 0 ]; then
				echo "Arg \"-d\": time must be greater than 0."
				usage
				exit $EXIT_UNKNOWN
			fi
			;;
		-f*)
			CHECK_LOGFILE="$(echo "${arg}" | sed 's/-f//')"
			;;
		-e)
			CHECK_ENCRYPTED=1
			;;
		-c)
			CHECK_COMPRESSED=1
			;;
		-l)
			CHECK_LOGGING=1
			;;
		*)
			printf "Invalid argument: \"%s\"\n" "${arg}"
			usage
			exit $EXIT_UNKNOWN
			;;
	esac
done

# Time is required
if [ -z $CHECK_TIME ]; then
	echo "Arg \"-i\" is required."
	usage
	exit $EXIT_UNKNOWN
fi

# Logfile
if [ -z $CHECK_LOGFILE ]; then
	echo "Arg \"-f\" is required."
	usage
	exit $EXIT_UNKNOWN
fi
if [ ! -f "${CHECK_LOGFILE}" ]; then
	echo "File does not exist in: ${CHECK_LOGFILE}"
	exit $EXIT_UNKNOWN
fi
if [ ! -r "${CHECK_LOGFILE}" ]; then
	echo "${CHECK_LOGFILE} is not readable"
	exit $EXIT_UNKNOWN
fi



################################################################################
#
# Read status file
#
################################################################################
STATUS_FILE="$(cat "${CHECK_LOGFILE}")"

# Status file is valid?
ALL_KEYS="^success= ^lastbak= ^message= ^msg_dbs= ^msg_ign= ^msg_meg= ^msg_sec= ^opt_log= ^opt_com= ^opt_enc= ^opt_del= ^del_time="
for w in $ALL_KEYS; do
	if ! grep "$w" "${CHECK_LOGFILE}" > /dev/null 2>&1 ; then
		echo "${CHECK_LOGFILE} is corrupt. Missing: \"${w}\""
		exit $EXIT_UNKNOWN
	fi
done

# Exit code and last backup timestamp
STATUS_SUCCESS="$(ini_get "${STATUS_FILE}" "success")"
STATUS_LASTBAK="$(ini_get "${STATUS_FILE}" "lastbak")"
STATUS_MESSAGE="$(ini_get "${STATUS_FILE}" "message")"
# Info Messages
STATUS_MSG_DBS="$(ini_get "${STATUS_FILE}" "msg_dbs")"
STATUS_MSG_IGN="$(ini_get "${STATUS_FILE}" "msg_ign")"
STATUS_MSG_MEG="$(ini_get "${STATUS_FILE}" "msg_meg")"
STATUS_MSG_SEC="$(ini_get "${STATUS_FILE}" "msg_sec")"
# Used options
STATUS_OPT_LOG="$(ini_get "${STATUS_FILE}" "opt_log")"
STATUS_OPT_COM="$(ini_get "${STATUS_FILE}" "opt_com")"
STATUS_OPT_ENC="$(ini_get "${STATUS_FILE}" "opt_enc")"
STATUS_OPT_DEL="$(ini_get "${STATUS_FILE}" "opt_del")"



################################################################################
#
# Validate status file
#
################################################################################

if [ "$STATUS_SUCCESS" != "0" ] && [ "$STATUS_SUCCESS" != "1" ] && [ "$STATUS_SUCCESS" != "2" ] && [ "$STATUS_SUCCESS" != "3" ]; then
	echo "Invalid value for \"success\". Corrupt file: ${CHECK_LOGFILE}"
	exit $EXIT_UNKNOWN
fi
if ! isint $STATUS_LASTBAK; then
	echo "Invalid value for \"lastbak\". Corrupt file: ${CHECK_LOGFILE}"
	exit $EXIT_UNKNOWN
fi
if [ "$STATUS_OPT_LOG" != "0" ] && [ "$STATUS_OPT_LOG" != "1" ]; then
	echo "Invalid value for \"opt_log\". Corrupt file: ${CHECK_LOGFILE}"
	exit $EXIT_UNKNOWN
fi
if [ "$STATUS_OPT_COM" != "0" ] && [ "$STATUS_OPT_COM" != "1" ]; then
	echo "Invalid value for \"opt_com\". Corrupt file: ${CHECK_LOGFILE}"
	exit $EXIT_UNKNOWN
fi
if [ "$STATUS_OPT_ENC" != "0" ] && [ "$STATUS_OPT_ENC" != "1" ]; then
	echo "Invalid value for \"opt_enc\". Corrupt file: ${CHECK_LOGFILE}"
	exit $EXIT_UNKNOWN
fi
if [ "$STATUS_OPT_DEL" != "0" ] && [ "$STATUS_OPT_DEL" != "1" ]; then
	echo "Invalid value for \"opt_del\". Corrupt file: ${CHECK_LOGFILE}"
	exit $EXIT_UNKNOWN
fi



################################################################################
#
# Actual Checking
#
################################################################################


# Concatenate Error and warning messages
# Increase exit status from 0 -> 1 -> 2
# Unknown exist stati are handled above already


ERRNO=0
ERROR=""
hours_ago=$(_time_ago "$(_timestamp_now)" "$STATUS_LASTBAK" )

#### Warning Levels
if [ -n "$CHECK_COMPRESSED" ] && [ "${STATUS_OPT_COM}" != "1" ]; then
	ERRNO=$EXIT_WARN
	ERROR="${ERROR}[Warn]: Compression disabled. "
fi
if [ -n "$CHECK_LOGGING" ] && [ "${STATUS_OPT_COM}" != "1" ]; then
	ERRNO=$EXIT_WARN
	ERROR="${ERROR}[Warn]: Logging disabled. "
fi
if [ -n "$CHECK_DELETION" ] && [ "${STATUS_OPT_DEL}" != "1" ]; then
	ERRNO=$EXIT_WARN
	ERROR="${ERROR}[Warn]: Tmpwatch disablde. "
fi

#### Error Levels
MSG_DUE="$(check_backup_due_date $CHECK_TIME $STATUS_LASTBAK)"
if [ $? -ne 0 ]; then
	ERRNO=$EXIT_ERR
	ERROR="${ERROR}${MSG_DUE} "
fi
if [ -n "$CHECK_ENCRYPTED" ] && [ "${STATUS_OPT_ENC}" != "1" ]; then
	ERRNO=$EXIT_ERR
	ERROR="${ERROR}[Err]: Encryption disabled. "
fi


if [ "$STATUS_SUCCESS" = "0" ]; then
	ERROR="${ERROR}$(printf "[OK]: Dumped %s/%s dbs (%sMB) (took: %ss) %s ago. " "${STATUS_MSG_DBS}" "$(expr $STATUS_MSG_DBS + $STATUS_MSG_IGN)" "${STATUS_MSG_MEG}" "${STATUS_MSG_SEC}" "${hours_ago}")"
elif [ "$STATUS_SUCCESS" = "1" ]; then
	if [ $ERRNO -lt $EXIT_ERR ]; then
		ERRNO=$EXIT_WARN
	fi
	ERROR="${ERROR}$(printf "[Warn]: Dumped with warnings: %s/%s dbs (%sMB) (took: %ss) %s ago. " "${STATUS_MSG_DBS}" "$(expr $STATUS_MSG_DBS + $STATUS_MSG_IGN)" "${STATUS_MSG_MEG}" "${STATUS_MSG_SEC}" "${hours_ago}")"
elif [ "$STATUS_SUCCESS" = "2" ]; then
	ERROR="${ERROR}$(printf "[Err]: Dumped with errors: %s/%s dbs (%sMB) (took: %ss) %s ago. " "${STATUS_MSG_DBS}" "$(expr $STATUS_MSG_DBS + $STATUS_MSG_IGN)" "${STATUS_MSG_MEG}" "${STATUS_MSG_SEC}" "${hours_ago}")"
	ERRNO=$EXIT_ERR
else
	ERROR="${ERROR}$(printf "[Unknown]: Dumped with unknown: %s/%s dbs (%sMB) (took: %ss) %s ago. " "${STATUS_MSG_DBS}" "$(expr $STATUS_MSG_DBS + $STATUS_MSG_IGN)" "${STATUS_MSG_MEG}" "${STATUS_MSG_SEC}" "${hours_ago}")"
	ERRNO=$EXIT_ERR
fi

echo "${ERROR}${STATUS_MESSAGE}"
exit $ERRNO
