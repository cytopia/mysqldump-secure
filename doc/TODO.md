The script is currently not POSIX conform as it needs to check the exit codes of piped commands via
```shell
if [ ${PIPESTATUS[0]} -ne 0  ]; then
```
Another approach had been to check:
```shell
pipefail
```
which is unfortunately also not POSIX conform.

There is a solution that currently exists for pure POSIX conform exit code checking on piped commands.
http://cfaj.ca/shell/cus-faq-2.html
```shell
# ...
run() {
	#
}
# ...
```
This however did not work and needs further investigation.



