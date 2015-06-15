#!/bin/sh
#
# @author    Patrick Plocke <patrick@plocke.de>
# @gpg key   0x28BF179F
# @date      2015-06-13
# @licencse  MIT http://opensource.org/licenses/MIT
# @version   v0.1
#
# Script to dump databases one by one
#
# Features:
# ---------------------
# * Encryped output via public/private key (optional)
# * Compressed output via gzip (optional)
# * Database black list (optional)
# * Logfile (optional)
# * Custom mysqldump parameters
# * Dumping time, total time
# * Error handling
#
# Exit Codes
# ---------------------
# * 0: Success
# * 1: Script specific: (writeable directory, config file not found, wrong permissions)
# * 2: Required binary not found
# * 3: MySQL connection error
# * 4: MySQL Database dump error


################################################################################
#
# ADJUSTABLE VARIABLES
#
################################################################################

# Adjust this variable if your config file
# is placed somewhere else
CONFIG_FILE="/etc/dump-database.conf"




################################################################################
#
# HELPER FUNCTIONS
#
################################################################################

# Output to stdout and to file
output() {
	local MSG="${1}"		# Message to output
	local LOG="${2:-0}"		# Log? 1: yes 0: No (defaults to 0)
	local FILE="${3}"		# Logfile path

	printf "%s\n" "${MSG}"
	[ ${LOG} -eq 1 ] && printf "%s %s %s\n" "$(date '+%Y-%m-%d')" "$(date '+%H:%M:%S')" "${MSG}" >> "${FILE}"
	return 0
}
# Inline Output to stdout and to file (no newline)
outputi() {
	local MSG="${1}"		# Message to output
	local LOG="${2:-0}"		# Log? 1: yes 0: No (defaults to 0)
	local FILE="${3}"		# Logfile path

	printf "%s" "${MSG}"
	[ ${LOG} -eq 1 ] && printf "%s %s %s" "$(date '+%Y-%m-%d')" "$(date '+%H:%M:%S')" "${MSG}" >> "${FILE}"
	return 0
}
# Output to stdout and to file (no time)
outputn() {
	local MSG="${1}"		# Message to output
	local LOG="${2:-0}"		# Log? 1: yes 0: No (defaults to 0)
	local FILE="${3}"		# Logfile path

	printf "%s\n" "${MSG}"
	[ ${LOG} -eq 1 ] && printf "%s\n" "${MSG}" >> "${FILE}"
	return 0
}

# Test if argument is an integer
# @return integer	0: is numer | 1 not a number
isint(){
	printf '%d' "$1" >/dev/null 2>&1 && return 0 || return 1;
}

permission() {
	local file
	local perm

	file="${1}"

	# e.g. 640
	if [ "$(uname)" = "Linux" ]; then
		perm="$(stat --format '%a' ${file})"
	else # Darwin or FreeBSD
		perm="$(stat -f "%OLp" ${file})"
	fi

	echo $perm
	return 0
}




################################################################################
#
# ENTRY POINT: ERROR CHECKING
#
################################################################################


############################################################
# Config FIle
############################################################

if [ ! -f "${CONFIG_FILE}" ]; then
	output "[ERR]  Configuration file not found in ${CONFIG_FILE}"
	output "Aborting"
	exit 1
fi
if [ ! -r "${CONFIG_FILE}" ]; then
	output "[ERR]  Configuration file is not readable in ${CONFIG_FILE}"
	output "Aborting"
	exit 1
fi
if [ "$(permission "${CONFIG_FILE}")" != "400" ]; then
	output "[ERR]  Configuration file ${CONFIG_FILE} has dangerous permissions: $(permission "${CONFIG_FILE}")."
	output "[INFO] Fix it to 400"
	output "Aborting"
	exit 1
fi

# Read config file
. "${CONFIG_FILE}"




############################################################
# Logging Options
############################################################

# Logging set?
if [ -z ${LOG+x} ]; then
	output '[INFO] $LOG variable not set in ${CONFIG_FILE}'
	output "[INFO] Logging disabled"
	LOG=0
fi
# Logging requirements fullfilled?
if [ ${LOG} -eq 1 ]; then
	if [ -z ${LOGFILE+x} ]; then
		output '[WARN] Missing $LOGFILE variable in ${CONFIG_FILE}'
		output "[WARN] Logging disabled"
		LOG=0
	else
		if [ ! -f "${LOGFILE}" ]; then
			output "[WARN] Logfile does not exist in ${LOGFILE}"
			output "[INFO] Trying to create..."

			if ! touch "${LOGFILE}" > /dev/null 2>&1 ; then
				output "[ERR]  Failed to create file ${LOGFILE}"
				output "[WARN] Logging disabled"
				LOG=0
			else
				output "[INFO] Created file ${LOGFILE}"
				output "[INFO] Logging enabled"
				LOG=1
			fi
		else
			if [ ! -w "${LOGFILE}" ]; then
				output "[WARN] Logfile ${LOGFILE} not writeable"
				output "[WARN] Logging disabled"
				LOG=0
			fi
		fi
	fi
fi
if [ ${LOG} -eq 1 ]; then
	echo "" >> "${LOGFILE}"
	echo "---------------------------------------" >> "${LOGFILE}"
	echo "$(date '+%Y-%m-%d') $(date '+%H:%M:%S') Starting" >> "${LOGFILE}"
fi



############################################################
# Destination Directory and Prefix
############################################################

# Check if destination dir exists
if [ ! -d "${TARGET}" ]; then
	output "[WARN] Destination dir ${TARGET} does not exist" $LOG "${LOGFILE}"
	outputi "[INFO] Trying to create... " $LOG "${LOGFILE}"
	if ! mkdir -p "${TARGET}" > /dev/null 2>&1 ; then
		outputn "Failed" $LOG "${LOGFILE}"
		output "Aborting" $LOG "${LOGFILE}"
		exit 1
	else
		output "Done"
		output "[INFO] Adjusting file permissions on ${TARGET}" $LOG "${LOGFILE}"
		chmod 0700 "${TARGET}"
	fi
fi
# Check if destination dir is writeable
if [ ! -w "${TARGET}" ]; then
	output "[WARN] Destination dir ${TARGET} is not writeable" $LOG "${LOGFILE}"
	outputi "[INFO] Trying to chmod... " $LOG "${LOGFILE}"
	if ! chmod 0700 "${TARGET}" > /dev/null 2>&1 ; then
		outputn "Failed" $LOG "${LOGFILE}"
		output "Aborting" $LOG "${LOGFILE}"
		exit 1
	else
		outputn "Done" $LOG "${LOGFILE}"
	fi
	outputi "[INFO] Trying to chown... " $LOG "${LOGFILE}"
	if ! chown "$(whoami)" "${TARGET}" > /dev/null 2>&1 ; then
		outputn "Failed" $LOG "${LOGFILE}"
		output "Aborting" $LOG "${LOGFILE}"
		exit 1
	else
		outputn "Done" $LOG "${LOGFILE}"
	fi
fi
# Check correct permissions of destination dir
if [ "$(permission "${TARGET}")" != "700" ]; then
	output "[ERR]  Target directory has dangerous permissions: $(permission "${TARGET}")."
	output "[INFO] Fix it to 700"
	output "Aborting"
	exit 1
fi
# Check output Prefix
if [ -z ${PREFIX+x} ]; then
	output '[INFO] $PREFIX variable not set in ${CONFIG_FILE}'
	output "[INFO] Using default 'date-time' prefix"
	PREFIX="$(date '+%Y-%m-%d')_$(date '+%H-%M')__"
fi



############################################################
# MySQL
############################################################
if ! command -v mysql > /dev/null 2>&1 ; then
	output "[ERR]  'mysql' not found" $LOG "${LOGFILE}"
	output "Aborting" $LOG "${LOGFILE}"
	exit 2
fi
if ! command -v mysqldump > /dev/null 2>&1 ; then
	output "[ERR]  'mysqldump' not found" $LOG "${LOGFILE}"
	output "Aborting" $LOG "${LOGFILE}"
	exit 2
fi
# Testing MySQL connection
if ! $(which mysql) --user=${MYSQL_USER} --password=${MYSQL_PASS} --host=${MYSQL_HOST} -e exit > /dev/null 2>&1 ; then
	output "[ERR]  Cannot connect to mysql database"
	output "Aborting" $LOG "${LOGFILE}"
	exit 3
fi



############################################################
# Compression
############################################################
if [ -z ${COMPRESS+x} ]; then
	output '[INFO] $COMPRESS variable not set in ${CONFIG_FILE}'
	output "[INFO] Compression disabled"
	COMPRESS=0
fi
if [ ${COMPRESS} -eq 1 ]; then
	if ! command -v gzip > /dev/null 2>&1 ; then
		output "[WARN] 'gzip' not found" $LOG "${LOGFILE}"
		output "[WARN] Disabling compression" $LOG "${LOGFILE}"
		COMPRESS=0
	fi
fi



############################################################
# Encryption
############################################################
if [ -z ${ENCRYPT+x} ]; then
	output '[INFO] $ENCRYPT variable not set in ${CONFIG_FILE}'
	output "[INFO] Encryption disabled"
	ENCRYPT=0
fi
if [ ${ENCRYPT} -eq 1 ]; then
	if ! command -v openssl > /dev/null 2>&1 ; then
		output "[ERR]  'openssl' not found" $LOG "${LOGFILE}"
		output "Aborting" $LOG "${LOGFILE}"
		exit 2
	fi
	if [ ! -f "${OPENSSL_PUBKEY_PEM}" ]; then
		output "[ERR]  OpenSSL pubkey not found in ${OPENSSL_PUBKEY_PEM}" $LOG "${LOGFILE}"
		output "Aborting" $LOG "${LOGFILE}"
		exit 2
	fi
	if [ -z ${OPENSSL_ALGO_ARG+x} ]; then
		output '[WARN] $OPENSSL_ALGO_ARG variable not set in ${CONFIG_FILE}'
		output "[INFO] Encryption defaults to -aes256"
		OPENSSL_ALGO_ARG="-aes256"
	fi
	# Test openssl Algo
	if ! echo "test" | $(which openssl) smime -encrypt -binary -text -outform DER ${OPENSSL_ALGO_ARG} "${OPENSSL_PUBKEY_PEM}" > /dev/null 2>&1 ; then
		output '[ERR]  openssl encryption test failed. Validate $OPENSSL_ALGO_ARG' $LOG "${LOGFILE}"
		output "Aborting" $LOG "${LOGFILE}"
		exit 2
	fi
fi



############################################################
# Deletion
############################################################

if [ -z ${DELETE+x} ]; then
	output '[INFO] $DELETE variable not set in ${CONFIG_FILE}'
	output "[INFO] Deletion of old files disabled"
	DELETE=0
fi
if [ ${DELETE} -eq 1  ]; then
	if [ -z ${DELETE_IF_OLDER+x} ]; then
		output '[WARN] $DELETE_IF_OLDER variable not set in ${CONFIG_FILE}'
		output "[WARN] Deletion of old files disabled"
		DELETE=0
	elif ! isint ${DELETE_IF_OLDER} > /dev/null 2>&1 ; then
		output '[WARN] $DELETE_IF_OLDER variable is not a valid integer'
		output "[WARN] Deletion of old files disabled"
		DELETE=0
	elif [ ${DELETE_IF_OLDER} -lt 1 ]; then
		output '[WARN] $DELETE_IF_OLDER is smaller than 1 hour'
		output "[WARN] Deletion of old files disabled"
		DELETE=0
	elif ! command -v tmpwatch > /dev/null 2>&1 ; then
		output "[WARN] 'tmpwatch' not found" $LOG "${LOGFILE}"
		output "[WARN] Deletion of old files disabled"
		DELETE=0
	fi
fi








################################################################################
#
# ENTRY POINT: MAIN
#
################################################################################

# Binaries
MYSQL="$(which mysql)"
MYSQLDUMP="$(which mysqldump)"
GZIP="$(which gzip)"
OPENSSL="$(which openssl)"
TMPWATCH="$(which tmpwatch)"

ERROR=0


############################################################
# Get all databases
############################################################

# Get a list of all databases
outputi "[INFO] Retrieving list of databases... " $LOG "${LOGFILE}"
DATABASES="$( ${MYSQL} --user=${MYSQL_USER} --password=${MYSQL_PASS} --host=${MYSQL_HOST} --batch -e 'show databases;')"
DATABASES="$( echo "${DATABASES}" | sed 1d )"
NUM_DB="$(echo "${DATABASES}" | wc -l | tr -d ' ')"
outputn "${NUM_DB}" $LOG "${LOGFILE}"



############################################################
# Dump databases
############################################################

TOTAL_STARTTIME=$(date +%s)
output "[INFO] Backup directory: ${TARGET}" $LOG "${LOGFILE}"

for db in ${DATABASES}; do

	# Skip specified databases
	skip=0
	for ign_db in ${IGNORE}; do
		if [ "${ign_db}" = "${db}" ]; then
			skip=1
		fi
	done

	if [ ${skip} -eq 0 ]; then
		starttime=$(date +%s)
		ext=""	# file extension
		if [ ${COMPRESS} -eq 1 ]; then
			if [ ${ENCRYPT} -eq 1 ]; then
				ext=".sql.gz.pem"
				outputi "Dumping:  ${db} (compressed) (encrypted) " $LOG "${LOGFILE}"
				${MYSQLDUMP} ${MYSQL_OPTS} --user=${MYSQL_USER} --password=${MYSQL_PASS} --host=${MYSQL_HOST} "${db}" | ${GZIP} -9 | ${OPENSSL} smime -encrypt -binary -text -outform DER ${OPENSSL_ALGO_ARG} -out "${TARGET}/${PREFIX}${db}${ext}" "${OPENSSL_PUBKEY_PEM}"
			else
				ext=".sql.gz"
				outputi "Dumping:  ${db} (compressed) " $LOG "${LOGFILE}"
				${MYSQLDUMP} ${MYSQL_OPTS} --user=${MYSQL_USER} --password=${MYSQL_PASS} --host=${MYSQL_HOST} "${db}" | ${GZIP} -9 > "${TARGET}/${PREFIX}${db}${ext}"
			fi
		else
			if [ ${ENCRYPT} -eq 1 ]; then
				ext=".sql.pem"
				outputi "Dumping:  ${db} (encrypted) " $LOG "${LOGFILE}"
				${MYSQLDUMP} ${MYSQL_OPTS} --user=${MYSQL_USER} --password=${MYSQL_PASS} --host=${MYSQL_HOST} "${db}" | ${OPENSSL} smime -encrypt -binary -text -outform DER ${OPENSSL_ALGO_ARG} -out "${TARGET}/${PREFIX}${db}${ext}" "${OPENSSL_PUBKEY_PEM}"
			else
				ext=".sql"
				outputi "Dumping:  ${db} " $LOG "${LOGFILE}"
				${MYSQLDUMP} ${MYSQL_OPTS} --user=${MYSQL_USER} --password=${MYSQL_PASS} --host=${MYSQL_HOST} "${db}" > "${TARGET}/${PREFIX}${db}${ext}"
			fi
		fi

		# We cannot check against $? as the first if uses a pipe | gzip and so we
		# need to check against the exit code of the first pipe status
		#
		# TODO: $PIPESTATUS is not POSIX conform
		# http://cfaj.ca/shell/cus-faq-2.html
		# check run()
		if [ ${PIPESTATUS[0]} -ne 0 ]; then
			outputn "ERROR" $LOG "${LOGFILE}"
			ERROR=1
		else
			endtime=$(date +%s)
			outputn "$(($endtime - $starttime)) sec" $LOG "${LOGFILE}"

			chmod 600 "${TARGET}/${PREFIX}${db}${ext}"
		fi
	else
		output "Skipping: ${db}" $LOG "${LOGFILE}"
	fi
done
TOTAL_ENDTIME=$(date +%s)

if [ $ERROR -ne 0 ]; then
	output "[ERR]  Some errors occured while dumping" $LOG "${LOGFILE}"
else
	output "[INFO] Dumping finished" $LOG "${LOGFILE}"
	output "[INFO] Took $(($TOTAL_ENDTIME - $TOTAL_STARTTIME)) seconds" $LOG "${LOGFILE}"
fi



############################################################
# Delete old Files
############################################################
if [ ${DELETE} -eq 1 ]; then
	output "[INFO] Deleting files older than ${DELETE_IF_OLDER} hours" $LOG "${LOGFILE}"
	DELETED="$(${TMPWATCH} -m ${DELETE_IF_OLDER} -v "${TARGET}/")"
	if [ $? -ne 0 ]; then
		ERROR=1
	fi
	output "${DELETED}" $LOG "${LOGFILE}"
fi



############################################################
# Exit
############################################################

if [ $ERROR -ne 0 ]; then
	# Send bad exit code
	output "[FAIL] Finished with errors" $LOG "${LOGFILE}"
	exit 4
else
	# Send good exit code
	output "[OK]   Finished successfully" $LOG "${LOGFILE}"
	exit 0
fi
