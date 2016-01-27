[Readme](https://github.com/cytopia/mysqldump-secure/blob/master/README.md) |
[Installation](https://github.com/cytopia/mysqldump-secure/blob/master/doc/INSTALL.md) |
[Configuration](https://github.com/cytopia/mysqldump-secure/blob/master/doc/SETUP.md) |
[Compression](https://github.com/cytopia/mysqldump-secure/blob/master/doc/COMPRESSION.md) |
[Encryption](https://github.com/cytopia/mysqldump-secure/blob/master/doc/ENCRYPTION.md) |
Examples |
[Contributing](https://github.com/cytopia/mysqldump-secure/blob/master/CONTRIBUTING.md)

---

# Examples

## Importing

### All plain sql files at once

If your desired sql files that you want to import are prefixed with `2015-12-29_14-24__` you can use the following one-liner to import them all.

```shell
prefix="2015-12-29_14-24__"; \
for i in ${prefix}*.sql ; do \
    db="$(echo "$i" | sed "s/${prefix}//" | sed 's/\.sql//')"; \
    mysql -u root -e "CREATE DATABASE IF NOT EXISTS \`$db\`;"; \
    mysql -u root $db < $i; \
done
```

### All gzipped sql files at once

```shell
prefix="2015-12-29_14-24__"; \
for i in ${prefix}*.sql.gz ; do \
    db="$(echo "$i" | sed "s/${prefix}//" | sed 's/\.sql\.gz//')"; \
    mysql -u root -e "CREATE DATABASE IF NOT EXISTS \`$db\`;"; \
    gunzip < "$i" | mysql -u root $db; \
done
```

### All bzip2 sql files at once

```shell
prefix="2015-12-29_14-24__"; \
for i in ${prefix}*.sql.bz2 ; do \
    db="$(echo "$i" | sed "s/${prefix}//" | sed 's/\.sql\.bz2//')"; \
    mysql -u root -e "CREATE DATABASE IF NOT EXISTS \`$db\`;"; \
    bunzip < "$i" | mysql -u root $db; \
done
```
