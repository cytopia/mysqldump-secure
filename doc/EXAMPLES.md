# Examples

## Importing

### All plain sql files at once

If your desired sql files that you want to import are prefixed with `2015-12-29_14-24__` you can use the following one-liner to import them all.

```shell
for i in 2015-12-29_14-24__*.sql ; do \
    db="$(echo "$i" | sed 's/2015-12-29_14-24__//' | sed 's/\.sql//')"; \
    mysql -e "CREATE DATABASE IF NOT EXISTS $db"; \
    mysql $name < $i;\
done
```
