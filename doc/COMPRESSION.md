[Readme](https://github.com/cytopia/mysqldump-secure/blob/master/README.md) |
[Installation](https://github.com/cytopia/mysqldump-secure/blob/master/doc/INSTALL.md) |
[Configuration](https://github.com/cytopia/mysqldump-secure/blob/master/doc/SETUP.md) |
Compression |
[Encryption](https://github.com/cytopia/mysqldump-secure/blob/master/doc/ENCRYPTION.md) |
[Examples](https://github.com/cytopia/mysqldump-secure/blob/master/doc/EXAMPLES.md) |
[Contributing](https://github.com/cytopia/mysqldump-secure/blob/master/CONTRIBUTING.md)

---


# Compression

## Perfomance

When you choose a compression algorithm also keep in mind they have different performances. The following shows a direct comparison between `gzip -9`, `bzip2 -9` and the multithreaded version `pbzip2 -9` for smaller and medium sized databases.

It was tested on a MacBookPro (2014), Intel Core i7 2.5Ghz (8 cores).


### Time

The total time taken to `mysqldump`, compress and write the dump to disk. The size in brackets refers to the database size in `MySQL`.

|       | gzip -9 | bzip2 -9 | pbzip2 -9 |
|-------|---------|----------|-----------|
| db_01 |  (433.66 MB) 19 sec |  (433.66 MB) 45 sec |  (433.66 MB) 14 sec |
| db_02 |  (166.68 MB) 4 sec |  (166.68 MB) 26 sec |  (166.68 MB) 10 sec |
| db_03 |  (14.39 MB) 1 sec |  (14.39 MB) 1 sec |  (14.39 MB) 1 sec |
| db_04 |  (39.28 MB) 2 sec |  (39.28 MB) 4 sec |  (39.28 MB) 1 sec |
| db_05 |  (14.39 MB) 1 sec |  (14.39 MB) 2 sec |  (14.39 MB) 1 sec |
| db_06 |  (10.71 MB) 1 sec |  (10.71 MB) 1 sec |  (10.71 MB) 0 sec |
| db_07 |  (44.48 MB) 2 sec |  (44.48 MB) 3 sec |  (44.48 MB) 2 sec |
| db_08 |  (44.46 MB) 2 sec |  (44.46 MB) 3 sec |  (44.46 MB) 1 sec |
| db_09 |  (266.39 MB) 15 sec |  (266.39 MB) 29 sec |  (266.39 MB) 10 sec |
| db_10 |  (17.24 MB) 0 sec |  (17.24 MB) 2 sec |  (17.24 MB) 0 sec |
| db_11 |  (499.33 MB) 30 sec |  (499.33 MB) 65 sec |  (499.33 MB) 22 sec |
| db_12 |  (20.18 MB) 1 sec |  (20.18 MB) 2 sec |  (20.18 MB) 1 sec |
| db_13 |  (6.93 MB) 0 sec |  (6.93 MB) 0 sec |  (6.93 MB) 1 sec |
| db_14 |  (6.74 MB) 1 sec |  (6.74 MB) 0 sec |  (6.74 MB) 0 sec |
| db_15 |  (95.97 MB) 4 sec |  (95.97 MB) 6 sec |  (95.97 MB) 3 sec |
| db_16 |  (12.49 MB) 0 sec |  (12.49 MB) 1 sec |  (12.49 MB) 0 sec |
| db_17 |  (158.29 MB) 4 sec |  (158.29 MB) 16 sec |  (158.29 MB) 4 sec |
| db_18 |  (19654.08 MB) 422 sec |  (19654.08 MB) 2464 sec |  (19654.08 MB) 773 sec |

Looks like `pbzip2` is generally faster than `gzip` (and a lot faster than `bzip2`), except for bigger files (see `db_18`).


### Final filesize

This is the resulting file size from `ls -lh`

|       | gzip -9 | bzip2 -9 | pbzip2 -9 |
|-------|---------|----------|-----------|
| db_01 |   35M   |  26M     |  26M      |
| db_02 |  5.5M   | 3.8M     | 3.8M      |
| db_03 |  757K   | 556K     | 557K      |
| db_04 |  3.1M   | 2.3M     | 2.3M      |
| db_05 |  757K   | 556K     | 557K      |
| db_06 |  464K   | 339K     | 339K      |
| db_07 |  3.5M   | 2.8M     | 2.8M      |
| db_08 |  3.5M   | 2.8M     | 2.8M      |
| db_09 |   19M   |  14M     |  14M      |
| db_10 |  756K   | 505K     | 506K      |
| db_11 |   49M   |  36M     |  36M      |
| db_12 |  1.1M   | 802K     | 803K      |
| db_13 |  143K   | 112K     | 112K      |
| db_14 |  129K   | 102K     | 102K      |
| db_15 |  6.6M   | 5.2M     | 5.2M      |
| db_16 |  597K   | 385K     | 386K      |
| db_17 |   12M   | 8.9M     | 8.9M      |
| db_18 |  638M   | 464M     | 465M      |

The difference in file size is quiet noticable.

### System Load

#### gzip -9
![gzip -9](https://raw.githubusercontent.com/cytopia/mysqldump-secure/master/doc/img/gzip-9.png)

#### bzip2 -9
![bzip2 -9](https://raw.githubusercontent.com/cytopia/mysqldump-secure/master/doc/img/bzip2-9.png)

#### pbzip2 -9
![pbzip2 -9](https://raw.githubusercontent.com/cytopia/mysqldump-secure/master/doc/img/pbzip2-9.png)
