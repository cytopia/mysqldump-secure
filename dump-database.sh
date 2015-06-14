#!/bin/sh
#
# @author    Patrick Plocke <patrick@plocke.de>
# @gpg key   0x28BF179F
# @date      2015-06-13
# @licencse  MIT http://opensource.org/licenses/MIT
# @version   v0.1
#
# Script to dump databases one by one
# Features:
# * Database black list
# * Compressed output (optional)
# * Logfile (optional)
# * Custom mysqldump parameters
# * Dumping time, total time
# * Error handling


# Adjust this variable if your config file
# is placed somewhere else
CONFIG_FILE="/etc/dump-database.conf"



# Output to stdout and to file
output() {
	MSG="${1}"		# Message to output
	LOG="${2}"		# Log? 1: yes 0: No
	FILE="${3}"		# Logfile path

	printf "%s\n" "${MSG}"
	[ ${LOG} -eq 1 ] && printf "%s %s %s\n" "$(date '+%Y-%m-%d')" "$(date '+%H:%M:%S')" "${MSG}" >> "${FILE}"
}

# Inline Output to stdout and to file (no newline)
outputi() {
	MSG="${1}"		# Message to output
	LOG="${2}"		# Log? 1: yes 0: No
	FILE="${3}"		# Logfile path

	printf "%s" "${MSG}"
	[ ${LOG} -eq 1 ] && printf "%s %s %s" "$(date '+%Y-%m-%d')" "$(date '+%H:%M:%S')" "${MSG}" >> "${FILE}"
}
# Output to stdout and to file (no time)
outputn() {
	MSG="${1}"		# Message to output
	LOG="${2}"		# Log? 1: yes 0: No
	FILE="${3}"		# Logfile path

	printf "%s\n" "${MSG}"
	[ ${LOG} -eq 1 ] && printf "%s\n" "${MSG}" >> "${FILE}"
}



# 1.) ---- Read configuration file
if [ ! -f "${CONFIG_FILE}" ]; then
	echo "Configuration file not found in ${CONFIG_FILE}"
	echo "Aborting"
	exit 1
fi
. "${CONFIG_FILE}"



# 2.) ---- Read Logging options
if [ -z ${LOG+x} ]; then
	echo 'Missing $LOG variable in ${CONFIG_FILE}'
	echo "Aborting"
	exit 1
fi
if [ ${LOG} -eq 1 ]; then
	if [ -z ${LOGFILE+x} ]; then
		echo 'Missing $LOGFILE variable in ${CONFIG_FILE}'
		echo "Logging disabled"
		LOG=0
	else
		if [ ! -f "${LOGFILE}" ]; then
			echo "Logfile does not exist in ${LOGFILE}"
			echo "Trying to create..."
			touch "${LOGFILE}" > /dev/null 2>&1

			if [ $? -ne 0 ]; then
				echo "Failed to create file ${LOGFILE}"
				echo "Logging disabled"
				LOG=0
			else
				echo "Created file ${LOGFILE}"
				echo "Logging enabled"
				LOG=1
			fi
		else
			if [ ! -w "${LOGFILE}" ]; then
				echo "Logfile ${LOGFILE} not writeable"
				echo "Logging disabled"
				LOG=0
			fi
		fi
	fi
fi
if [ ${LOG} -eq 1 ]; then
	echo "\n---------------------------------------" >> "${LOGFILE}"
	echo "$(date '+%Y-%m-%d') $(date '+%H:%M:%S') Starting" >> "${LOGFILE}"
fi



# 3.) ---- Destination dir
# Check if destination dir exists
if [ ! -d "${TARGET}" ]; then
	output "Destination dir ${TARGET} does not exist" $LOG "${LOGFILE}"
	outputi "Trying to create... " $LOG "${LOGFILE}"
	mkdir -p "${TARGET}" > /dev/null 2>&1
	if [ $? -ne 0 ]; then
		outputn "Failed" $LOG "${LOGFILE}"
		output "Aborting" $LOG "${LOGFILE}"
		exit 1
	else
		output "Done"
		output "Adjusting file permissions on ${TARGET}" $LOG "${LOGFILE}"
		chmod 0700 "${TARGET}"
	fi
fi
# Check if destination dir is writeable
if [ ! -w "${TARGET}" ]; then
	output "Destination dir ${TARGET} is not writeable" $LOG "${LOGFILE}"
	outputi "Trying to chmod... " $LOG "${LOGFILE}"
	chmod 0700 "${TARGET}" > /dev/null 2>&1
	if [ $? -ne 0 ]; then
		outputn "Failed" $LOG "${LOGFILE}"
		output "Aborting" $LOG "${LOGFILE}"
		exit 1
	else
		output "Done" $LOG "${LOGFILE}"
	fi
	outputi "Trying to chown... " $LOG "${LOGFILE}"
	chown "$(whoami)" "${TARGET}" > /dev/null 2>&1
	if [ $? -ne 0 ]; then
		outputn "Failed" $LOG "${LOGFILE}"
		output "Aborting" $LOG "${LOGFILE}"
		exit 1
	else
		output "Done" $LOG "${LOGFILE}"
	fi
fi


# 4.) ---- Check binaries
if ! command -v mysql > /dev/null 2>&1 ; then
	output "'mysql' not found" $LOG "${LOGFILE}"
	output "Aborting" $LOG "${LOGFILE}"
	exit 2
fi
if ! command -v mysqldump > /dev/null 2>&1 ; then
	output "'mysqldump' not found" $LOG "${LOGFILE}"
	output "Aborting" $LOG "${LOGFILE}"
	exit 2
fi
if [ ${COMPRESS} -eq 1 ]; then
	if ! command -v gzip > /dev/null 2>&1 ; then
		output "'gzip' not found" $LOG "${LOGFILE}"
		output "Disabling compression" $LOG "${LOGFILE}"
		COMPRESS=0
	fi
fi



# Binaries
MYSQL="$(which mysql)"
MYSQLDUMP="$(which mysqldump)"
GZIP="$(which gzip)"

# Date/Time Prefix
DATE="$(date '+%Y-%m-%d')"
TIME="$(date '+%H-%M')"





# Get a list of all databases
outputi "Retrieving list of databases... " $LOG "${LOGFILE}"
DATABASES="$( ${MYSQL} --user=${MYSQL_USER} --password=${MYSQL_PASS} --host=${MYSQL_HOST} --batch -e 'show databases;')"
if [ $? -ne 0 ]; then
	exit 3
fi
DATABASES="$( echo "${DATABASES}" | sed 1d )"
outputn "$( echo "${DATABASES}" | wc -l)" $LOG "${LOGFILE}"


TOTAL_STARTTIME=$(date +%s)
ERROR=0
# Dump database one by one
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
		if [ ${COMPRESS} -eq 1 ]; then
			outputi "Dumping:  ${db} (compressed) " $LOG "${LOGFILE}"
			${MYSQLDUMP} ${MYSQL_OPTS} --user=${MYSQL_USER} --password=${MYSQL_PASS} --host=${MYSQL_HOST} "${db}" | ${GZIP} -9 > "${TARGET}/${DATE}_${TIME}__${db}.sql.gz"
		else
			outputi "Dumping:  ${db} " $LOG "${LOGFILE}"
			${MYSQLDUMP} ${MYSQL_OPTS} --user=${MYSQL_USER} --password=${MYSQL_PASS} --host=${MYSQL_HOST} "${db}" > "${TARGET}/${DATE}_${TIME}__${db}.sql"
		fi
		# We cannot check against $? as the first if uses a pipe | gzip and so we
		# need to check against the exit code of the first pipe status
		if [ ${PIPESTATUS[0]} -ne 0 ]; then
			outputn "ERROR" $LOG "${LOGFILE}"
			ERROR=1
		else
			endtime=$(date +%s)
			outputn "$(($endtime - $starttime)) sec" $LOG "${LOGFILE}"
		fi
	else
		output "Ignoring: ${db}" $LOG "${LOGFILE}"
	fi
done
TOTAL_ENDTIME=$(date +%s)

if [ $ERROR -ne 0 ]; then
	output "Some errors occured while dumping" $LOG "${LOGFILE}"
	exit 4
else
	output "Dumping finished" $LOG "${LOGFILE}"
	output "Took $(($TOTAL_ENDTIME - $TOTAL_STARTTIME)) seconds" $LOG "${LOGFILE}"
	# Send good exit code
	exit 0
fi
