#!/usr/bin/env bash

ERROR=0

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. "${DIR}/config"



################################################################################
#
# mysqldump-secure installation
#
################################################################################


#
# Kill servers
#
PID_SLAVE="$(sudo cat ${_INSTALL_PREFIX}/var/mysql-slave/*.pid)"
PID_MASTER="$(sudo cat ${_INSTALL_PREFIX}/var/mysql-master/*.pid)"

sudo kill ${PID_SLAVE}
sudo kill ${PID_MASTER}


#
# Remove existing directories
#
sudo rm -rif ${_INSTALL_PREFIX}



exit $ERROR
