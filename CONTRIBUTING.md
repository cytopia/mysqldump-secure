[Readme](https://github.com/cytopia/mysqldump-secure/blob/master/README.md) |
[Installation](https://github.com/cytopia/mysqldump-secure/blob/master/doc/INSTALL.md) |
[Requirements](https://github.com/cytopia/mysqldump-secure/blob/master/doc/REQUIREMENTS.md) |
[Configuration](https://github.com/cytopia/mysqldump-secure/blob/master/doc/SETUP.md) |
[Security](https://github.com/cytopia/mysqldump-secure/blob/master/doc/SECURITY.md) |
[Compression](https://github.com/cytopia/mysqldump-secure/blob/master/doc/COMPRESSION.md) |
[Encryption](https://github.com/cytopia/mysqldump-secure/blob/master/doc/ENCRYPTION.md) |
[Examples](https://github.com/cytopia/mysqldump-secure/blob/master/doc/EXAMPLES.md) |
Contributing

---

# Contributing


## Basics

1. Do report errors when you encounter them
2. Do report suggestions for enhancements
3. Let me know if this runs successfully on an operating system I have not listed yet (see [README](README.md))
4. Add more exotic compression algorithm when you use them successfully (see [here](https://github.com/cytopia/mysqldump-secure/blob/master/doc/SETUP.md#122-compression))
5. Extend the [Example](https://github.com/cytopia/mysqldump-secure/blob/master/doc/EXAMPLES.md) section


## Repository integration

Anybody willing to help me get this into

1. [X] ~~brew (OSX homebrew)~~
2. [ ] yum (CentOS)
3. [ ] apt (Debian)
4. [ ] apt (Ubuntu)
5. [ ] pkg (FreeBSD)

## Website / Documentation

* Extend documentation
* Improve project webpage
* Fix grammatical errors
* ...


## Pull requests

Whenever the code is changed or a pull-request is made, travis will trigger many hundred tests against the code and the program operation. All tests must pass without exception in order to accept the pull request.

The first check will run `shellcheck` in the most strict POSIX mode, after this test has passed the following will be checked for every single combination of configuration setting:

* Unbound variable tests (script runs with `#!/bin/sh -u`)
* Syntax error tests
* Abnormal program termination
* Abnormal behaviour
* Error handling and catching
`
Apart from this there are many more specific checks, some examples are:

* Backups cannot be overwritten
* Proper deletion (`tmpwatch` / `tpmreaper`)
* Checks against encryption
* basically all configuration directives are checked ...


## Credits

Credit goes where credit belongs. All contributors will be listed on the project homepage in the contributors section.

