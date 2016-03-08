[Readme](https://github.com/cytopia/mysqldump-secure/blob/master/README.md) |
[Installation](https://github.com/cytopia/mysqldump-secure/blob/master/doc/INSTALL.md) |
[Requirements](https://github.com/cytopia/mysqldump-secure/blob/master/doc/REQUIREMENTS.md) |
[Configuration](https://github.com/cytopia/mysqldump-secure/blob/master/doc/SETUP.md) |
Security |
[Compression](https://github.com/cytopia/mysqldump-secure/blob/master/doc/COMPRESSION.md) |
[Encryption](https://github.com/cytopia/mysqldump-secure/blob/master/doc/ENCRYPTION.md) |
[Examples](https://github.com/cytopia/mysqldump-secure/blob/master/doc/EXAMPLES.md) |
[Contributing](https://github.com/cytopia/mysqldump-secure/blob/master/CONTRIBUTING.md)

---


# Security

Mysqldump-secure was built with many security aspects in mind which are explained below.

## Database password stealing

When you run `mysqldump` with `-p` or `--password` option from command line or automated via cron, it is possible for other users to see the specified password in cleartext inside the system's process list via `ps auxw`.

One mechanism to prevent this is to enable `hidepid` on the mounted `/proc` device which will then hide your processes to all other users.

[Linux Kernel commit](https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/commit/?id=0499680a42141d86417a8fbaa8c8db806bea1201)
>> hidepid=1 means users may not access any /proc/<pid>/ directories, but
>> their own.  Sensitive files like cmdline, sched*, status are now protected
>> against other users.  As permission checking done in proc_pid_permission()
>> and files' permissions are left untouched, programs expecting specific
>> files' modes are not confused.

This however might not be possible on shared hostings.

The second more clever solution lies within the usage of mysql config files. Credentials specified in `my.cnf` (mysqldump section) are automatically used when running mysqldump without showing them in `ps auxw` or `top`.

Mysqldump-secure installs its own *.cnf* file where you can set the credentials for your mysqldump session.

In the best case you would create a user who only has read permissions on all databases you want to dump (including the mysql database).


## Default values

Mysqldump-secure's default permission values for files and folders are very strict and will only allow access (read/write) to the user starting the process (and obviously root, if it was not run by root).

Furthermore it will complain and in some cases abort if a file permission was not strict enough. For example if the password file was world readable, it will stop execution and inform you that the passwords could have been leaked.

For all other sensitive permissions, mysqldump-secure will auto-set them accordingly to the ones specified in `mysqldump-secure.conf`.


## Umask and chmod

If you have not set any special `umask` settings on the system, `mysqldump` (and any other program) will normally write the databases to disk with chmod `0644` permissions. If the parent folder is not protected, the dumps will be readable by anybody.

You could do a `chmod 0600` afterwards, but doing it afterwards is already too late, so `mysqldump-secure` is temporarily setting the `umask` prior writing the file to disk, so that it is possible to dump with `chmod 400`.

This can be accomplished in such a way:
```shell
umask 377; mysqldump
```

This however is your responsibility, if you should change the following two variables from `mysqldump-secure.conf`:
```shell
DUMP_DIR_CHMOD="0700"
DUMP_FILE_CHMOD="0400"
```

Always make sure to protect the parent directory (where the dumps are going to be) as well as the dumps itself.

## Encryption

Another layer of security is to also encrypt the database on the fly while dumping (before writing to disk). This is accomplished via hybrid encryption. It is using aes and private/public key encryption.

You will need to create a private/public keypair and only copy your public key to the server. Mysqldump-secure will make use of the public key to encrypt your dumps against (similar to pgp encryption).

Dump can only be decrypted with the private key, which should be somewhere safe and ideally not on the same server.
