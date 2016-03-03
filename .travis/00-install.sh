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
# Remove existing directories
#
if [ -d ${_INSTALL_PREFIX} ]; then
	sudo rm -rf "${_INSTALL_PREFIX}"
fi

#
# Create directories
#
sudo mkdir -p ${_INSTALL_PREFIX}

#
# Install mysqldump-secure
#
./configure --prefix="${_INSTALL_PREFIX}"
make
sudo make install



################################################################################
#
# mysqldump-secure configuration
#
################################################################################

#
# Create credentials file (MASTER server)
#
printf "[client]\nhost = 127.0.0.1\nport = ${SQL_MASTER_PORT}\nuser = root\npassword =\n" | sudo tee ${_INSTALL_PREFIX}/etc/mysqldump-secure.cnf

#
# Copy public/private keys
#
sudo cp -f ${DIR}/data/certs/mysqldump-secure.priv.pem ${_INSTALL_PREFIX}/etc/ && sudo chmod 600 ${_INSTALL_PREFIX}/etc/mysqldump-secure.priv.pem
sudo cp -f ${DIR}/data/certs/mysqldump-secure.pub.pem  ${_INSTALL_PREFIX}/etc/ && sudo chmod 600 ${_INSTALL_PREFIX}/etc/mysqldump-secure.pub.pem
#
# Enable SSL Connection
#
sudo sed -i'' "s|MYSQL_SSL_ENABLE=0|MYSQL_SSL_ENABLE=1|g" ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf
sudo sed -i'' "s|MYSQL_SSL_CA_PEM=\"/path/to/ca.pem\"|MYSQL_SSL_CA_PEM=\"${_INSTALL_PREFIX}/etc/mysql.ca.pem\"|g" ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf
# TODO: Validate this!
#- sudo sed -i'' 's/#MYSQL_SSL_CLIENT_CERT_PEM="\/path\/to\/client-cert.pem"/MYSQL_SSL_CLIENT_CERT_PEM="\/etc\/mysql.client-cert.pem"/g' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf
#- sudo sed -i'' 's/#MYSQL_SSL_CLIENT_KEY_PEM="\/path\/to\/client-key.pem"/MYSQL_SSL_CLIENT_KEY_PEM="\/etc\/mysql.client-key.pem"/g' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

# 3. Enable encryption
sudo sed -i'' 's/^ENCRYPT=0/ENCRYPT=1/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

# 4. Enable Nagios log
sudo sed -i'' 's/^NAGIOS_LOG=0/NAGIOS_LOG=1/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

# 5. Enable Deletion (Delete all files older than 1 minute)
sudo sed -i'' 's/^DELETE=0/DELETE=1/'                                  ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf
sudo sed -i'' 's/^DELETE_FORCE=0/DELETE_FORCE=1/'                      ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf
sudo sed -i'' 's/^DELETE_METHOD="tmpwatch"/DELETE_METHOD="tmpreaper"/' ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf
sudo sed -i'' 's/^DELETE_IF_OLDER=720/DELETE_IF_OLDER=1m/'             ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf

# 6. Show config
#sudo cat ${_INSTALL_PREFIX}/etc/mysqldump-secure.conf





################################################################################
#
# MySQL configuration
#
################################################################################

#
# Create directories for MySQL
#
sudo mkdir -p ${_INSTALL_PREFIX}/var/mysql-master
sudo mkdir -p ${_INSTALL_PREFIX}/var/log/mysql-master/

sudo mkdir -p ${_INSTALL_PREFIX}/var/mysql-slave
sudo mkdir -p ${_INSTALL_PREFIX}/var/log/mysql-slave/


#
# Copy MySQL certificates
#
sudo cp -f ${DIR}/data/certs/mysql.ca-key.pem      ${_INSTALL_PREFIX}/etc/ && sudo chmod 600 ${_INSTALL_PREFIX}/etc/mysql.ca-key.pem
sudo cp -f ${DIR}/data/certs/mysql.ca.pem          ${_INSTALL_PREFIX}/etc/ && sudo chmod 644 ${_INSTALL_PREFIX}/etc/mysql.ca.pem
sudo cp -f ${DIR}/data/certs/mysql.server-cert.pem ${_INSTALL_PREFIX}/etc/ && sudo chmod 644 ${_INSTALL_PREFIX}/etc/mysql.server-cert.pem
sudo cp -f ${DIR}/data/certs/mysql.server-key.pem  ${_INSTALL_PREFIX}/etc/ && sudo chmod 644 ${_INSTALL_PREFIX}/etc/mysql.server-key.pem
sudo cp -f ${DIR}/data/certs/mysql.client-cert.pem ${_INSTALL_PREFIX}/etc/ && sudo chmod 600 ${_INSTALL_PREFIX}/etc/mysql.client-cert.pem
sudo cp -f ${DIR}/data/certs/mysql.client-key.pem  ${_INSTALL_PREFIX}/etc/ && sudo chmod 600 ${_INSTALL_PREFIX}/etc/mysql.client-key.pem

#
# Copy MySQL Default file (in case it does not exist)
#
if [ ! -f /usr/share/mysql/my-default.cnf ]; then
	sudo cp ${DIR}/data/my-default.cnf /usr/share/mysql/my-default.cnf
fi

#
# Copy MySQL Configuration file
#
sudo cp -f ${DIR}/data/my-master.cnf ${_INSTALL_PREFIX}/etc/my-master.cnf
sudo cp -f ${DIR}/data/my-slave.cnf ${_INSTALL_PREFIX}/etc/my-slave.cnf


#
# Replace placeholders in *.cnf files
#
sudo sed -i'' "s|##SQL_MASTER_PORT##|${SQL_MASTER_PORT}|g" ${_INSTALL_PREFIX}/etc/my-master.cnf
sudo sed -i'' "s|##_INSTALL_PREFIX##|${_INSTALL_PREFIX}|g" ${_INSTALL_PREFIX}/etc/my-master.cnf

sudo sed -i'' "s|##SQL_SLAVE_PORT##|${SQL_SLAVE_PORT}|g" ${_INSTALL_PREFIX}/etc/my-slave.cnf
sudo sed -i'' "s|##_INSTALL_PREFIX##|${_INSTALL_PREFIX}|g" ${_INSTALL_PREFIX}/etc/my-slave.cnf


#
# Start MySQL Master
#
echo "[mysql] [master] install_db"
if sudo mysql_install_db --defaults-file=${_INSTALL_PREFIX}/etc/my-master.cnf > /dev/null 2>&1; then
	echo "[mysql] [master] install_db done"

	echo "[mysql] [master] server start"
	sudo mysqld --defaults-file=${_INSTALL_PREFIX}/etc/my-master.cnf &
	sleep 10
	echo "[mysql] [master] server start done"
fi

#
# Add User to MySQL Master
#
echo "[mysql] [master] Adding User"
sudo mysql --ssl-ca=${_INSTALL_PREFIX}/etc/mysql.ca.pem --user=root --host=127.0.0.1 --port=${SQL_MASTER_PORT} -e "CREATE USER 'slave_user'@'localhost' IDENTIFIED BY 'aaa';"
sudo mysql --ssl-ca=${_INSTALL_PREFIX}/etc/mysql.ca.pem --user=root --host=127.0.0.1 --port=${SQL_MASTER_PORT} -e "CREATE USER 'slave_user'@'127.0.0.1' IDENTIFIED BY 'aaa';"
sudo mysql --ssl-ca=${_INSTALL_PREFIX}/etc/mysql.ca.pem --user=root --host=127.0.0.1 --port=${SQL_MASTER_PORT} -e "CREATE USER 'slave_user'@'%' IDENTIFIED BY 'aaa';"
sudo mysql --ssl-ca=${_INSTALL_PREFIX}/etc/mysql.ca.pem --user=root --host=127.0.0.1 --port=${SQL_MASTER_PORT} -e "GRANT REPLICATION SLAVE ON *.* TO 'slave_user'@'localhost' IDENTIFIED BY 'aaa';"
sudo mysql --ssl-ca=${_INSTALL_PREFIX}/etc/mysql.ca.pem --user=root --host=127.0.0.1 --port=${SQL_MASTER_PORT} -e "GRANT REPLICATION SLAVE ON *.* TO 'slave_user'@'127.0.0.1' IDENTIFIED BY 'aaa';"
sudo mysql --ssl-ca=${_INSTALL_PREFIX}/etc/mysql.ca.pem --user=root --host=127.0.0.1 --port=${SQL_MASTER_PORT} -e "GRANT REPLICATION SLAVE ON *.* TO 'slave_user'@'%' IDENTIFIED BY 'aaa';"
sudo mysql --ssl-ca=${_INSTALL_PREFIX}/etc/mysql.ca.pem --user=root --host=127.0.0.1 --port=${SQL_MASTER_PORT} -e "FLUSH PRIVILEGES;"
echo "[mysql] [master] Adding User done"





#
# Start MySQL Slave
#
echo "[mysql] [slave] install_db"
if sudo mysql_install_db --defaults-file=${_INSTALL_PREFIX}/etc/my-slave.cnf > /dev/null 2>&1; then
	echo "[mysql] [slave] install_db done"

	echo "[mysql] [slave] server start"
	sudo mysqld --defaults-file=${_INSTALL_PREFIX}/etc/my-slave.cnf &
	sleep 10
	echo "[mysql] [slave] server start done"
fi


#
# Start Slave mode
#
echo "[mysql] [slave] Adding Master replication on slave"
sudo mysql --ssl-ca=${_INSTALL_PREFIX}/etc/mysql.ca.pem --user=root --host=127.0.0.1 --port=${SQL_SLAVE_PORT} -e "CHANGE MASTER TO MASTER_HOST='127.0.0.1', MASTER_PORT=${SQL_MASTER_PORT}, MASTER_USER='slave_user', MASTER_PASSWORD='aaa', MASTER_LOG_FILE='mysql-bin.000001';"
sudo mysql --ssl-ca=${_INSTALL_PREFIX}/etc/mysql.ca.pem --user=root --host=127.0.0.1 --port=${SQL_SLAVE_PORT} -e "START SLAVE;"
echo "[mysql] [slave] Adding Master replication on slave done"


#
# Status
#
sudo mysql --ssl-ca=${_INSTALL_PREFIX}/etc/mysql.ca.pem --user=root --host=127.0.0.1 --port=${SQL_MASTER_PORT} -e 'status;'
sudo mysql --ssl-ca=${_INSTALL_PREFIX}/etc/mysql.ca.pem --user=root --host=127.0.0.1 --port=${SQL_SLAVE_PORT} -e 'status;'


#
# Create databases (MASTER)
#
sudo mysql --ssl-ca=${_INSTALL_PREFIX}/etc/mysql.ca.pem --user=root --host=127.0.0.1 --port=${SQL_MASTER_PORT} -e 'create database my_empty_db1;'
sudo mysql --ssl-ca=${_INSTALL_PREFIX}/etc/mysql.ca.pem --user=root --host=127.0.0.1 --port=${SQL_MASTER_PORT} -e 'create database my_empty_db2;'
sudo mysql --ssl-ca=${_INSTALL_PREFIX}/etc/mysql.ca.pem --user=root --host=127.0.0.1 --port=${SQL_MASTER_PORT} -e 'create database db_InnoDB_only;'
sudo mysql --ssl-ca=${_INSTALL_PREFIX}/etc/mysql.ca.pem --user=root --host=127.0.0.1 --port=${SQL_MASTER_PORT} -e 'create database db_MyISAM_only;'
sudo mysql --ssl-ca=${_INSTALL_PREFIX}/etc/mysql.ca.pem --user=root --host=127.0.0.1 --port=${SQL_MASTER_PORT} -e 'create database db_InnoDB_and_MyISAM;'

#
# Import databases (MASTER)
#
bunzip2 < ${DIR}/data/db/db_InnoDB_only.sql.bz2       | sudo mysql --ssl-ca=${_INSTALL_PREFIX}/etc/mysql.ca.pem --user=root --host=127.0.0.1 --port=${SQL_MASTER_PORT} db_InnoDB_only
bunzip2 < ${DIR}/data/db/db_MyISAM_only.sql.bz2       | sudo mysql --ssl-ca=${_INSTALL_PREFIX}/etc/mysql.ca.pem --user=root --host=127.0.0.1 --port=${SQL_MASTER_PORT} db_MyISAM_only
bunzip2 < ${DIR}/data/db/db_InnoDB_and_MyISAM.sql.bz2 | sudo mysql --ssl-ca=${_INSTALL_PREFIX}/etc/mysql.ca.pem --user=root --host=127.0.0.1 --port=${SQL_MASTER_PORT} db_InnoDB_and_MyISAM









exit $ERROR
