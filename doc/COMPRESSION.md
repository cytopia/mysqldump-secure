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

It was tested on a MacBookPro (2014), Intel Core i7 2.5Ghz (8 cores) with 16GB RAM.


### Time

The total time taken from `mysqldump-secure` to dump,  compress and write the data to disk. The size in brackets refers to the database size in `MySQL`. The following represents a mean time calculated from 10 rounds.

|                    | direct<sup>[1]</sup>  | gzip -9 | bzip2 -9 | pbzip2 -9 | lzma -9<sup>[2]</sup> | xz -9   |
|--------------------|--------:|--------:|---------:|----------:|--------:|--------:|
| db_01 (433.66 MB)  |  15 sec |  19 sec |  45 sec  |  14 sec   | 148 sec | 145 sec |
| db_02 (166.68 MB)  |   7 sec |  4 sec  |  26 sec  |  10 sec   |  23 sec |  22 sec |
| db_03 (14.39 MB)   |   0 sec |  1 sec  |   1 sec  |   1 sec   |   2 sec |   2 sec |
| db_04 (39.28 MB)   |   2 sec |  2 sec  |   4 sec  |   1 sec   |  11 sec |  11 sec |
| db_05 (14.39 MB)   |   1 sec |  1 sec  |   2 sec  |   1 sec   |   2 sec |   2 sec |
| db_06 (10.71 MB)   |   0 sec |  1 sec  |   1 sec  |   0 sec   |   2 sec |   2 sec |
| db_07 (44.48 MB)   |   2 sec |  2 sec  |   3 sec  |   2 sec   |   9 sec |   8 sec |
| db_08 (44.46 MB)   |   1 sec |  2 sec  |   3 sec  |   1 sec   |   8 sec |   8 sec |
| db_09 (266.39 MB)  |  11 sec |  15 sec |  29 sec  |  10 sec   |  77 sec |  79 sec |
| db_10 (17.24 MB)   |   1 sec |  0 sec  |   2 sec  |   0 sec   |   3 sec |   3 sec |
| db_11 (499.33 MB)  |  26 sec |  30 sec |  65 sec  |  22 sec   | 181 sec | 171 sec |
| db_12 (20.18 MB)   |   1 sec |  1 sec  |   2 sec  |   1 sec   |   3 sec |   3 sec |
| db_13 (6.93 MB)    |   0 sec |  0 sec  |   0 sec  |   1 sec   |   1 sec |   1 sec |
| db_14 (6.74 MB)    |   1 sec |  1 sec  |   0 sec  |   0 sec   |   0 sec |   1 sec |
| db_15 (95.97 MB)   |   3 sec |  4 sec  |   6 sec  |   3 sec   |  15 sec |  15 sec |
| db_16 (12.49 MB)   |   1 sec |  0 sec  |   1 sec  |   0 sec   |   2 sec |   2 sec |
| db_17 (158.29 MB)  |   6 sec | 4 sec   |  16 sec  |   4 sec   |  27 sec |  26 sec |
| db_18 (19654.08 MB)| 634 sec | 422 sec |2464 sec  | 773 sec   |2556 sec |2934 sec |

* [1] `Direct` (without compression) is usually much slower than this, because most server HDD's are ofteb the bottleneck (my machine has a very fast PCIe SSD).
* [2] On modern systems `lzma` is usually an alias to `xz --format=lzma`


Looks like `pbzip2` is generally faster than `gzip` (and a lot faster than `bzip2`), except for bigger files (see `db_18`).


### Final filesize

This is the resulting file size from `ls -lh`.

|                    | direct | gzip -9 | bzip2 -9 | pbzip2 -9 | lzma -9 | xz -9 |
|--------------------|-------:|--------:|---------:|----------:|--------:|------:|
| db_01 (433.66 MB)  | 394M   |   35M   |  26M     |  26M      |   25M   |  25M  |
| db_02 (166.68 MB)  | 153M   |  5.5M   | 3.8M     | 3.8M      |  3.1M   | 3.1M  |
| db_03 (14.39 MB)   | 8.4M   |  757K   | 556K     | 557K      |  508K   | 508K  |
| db_04 (39.28 MB)   |  30M   |  3.1M   | 2.3M     | 2.3M      |  2.3M   | 2.3M  |
| db_05 (14.39 MB)   | 8.4M   |  757K   | 556K     | 557K      |  509K   | 509K  |
| db_06 (10.71 MB)   | 5.1M   |  464K   | 339K     | 339K      |  328K   | 328K  |
| db_07 (44.48 MB)   |  21M   |  3.5M   | 2.8M     | 2.8M      |  2.4M   | 2.4M  |
| db_08 (44.46 MB)   |  21M   |  3.5M   | 2.8M     | 2.8M      |  2.4M   | 2.4M  |
| db_09 (266.39 MB)  | 214M   |   19M   |  14M     |  14M      |   13M   |  13M  |
| db_10 (17.24 MB)   |  12M   |  756K   | 505K     | 506K      |  530K   | 538K  |
| db_11 (499.33 MB)  | 454M   |   49M   |  36M     |  36M      |   35M   |  35M  |
| db_12 (20.18 MB)   |  13M   |  1.1M   | 802K     | 803K      |  780K   | 781K  |
| db_13 (6.93 MB)    | 1.5M   |  143K   | 112K     | 112K      |  102K   | 102K  |
| db_14 (6.74 MB)    | 1.3M   |  129K   | 102K     | 102K      |   92K   |  92K  |
| db_15 (95.97 MB)   |  38M   |  6.6M   | 5.2M     | 5.2M      |  3.5M   | 3.5M  |
| db_16 (12.49 MB)   | 9.8M   |  597K   | 385K     | 386K      |  493K   | 493K  |
| db_17 (158.29 MB)  | 120M   |   12M   | 8.9M     | 8.9M      |  6.7M   | 6.7M  |
| db_18 (19654.08 MB)|  15G   |  638M   | 464M     | 465M      |  295M   | 295M  |




The difference in file size is quiet noticable.

### System Load

#### gzip -9
![gzip -9](https://raw.githubusercontent.com/cytopia/mysqldump-secure/master/doc/img/gzip-9.png)

#### bzip2 -9
![bzip2 -9](https://raw.githubusercontent.com/cytopia/mysqldump-secure/master/doc/img/bzip2-9.png)

#### pbzip2 -9
![pbzip2 -9](https://raw.githubusercontent.com/cytopia/mysqldump-secure/master/doc/img/pbzip2-9.png)

#### lzma -9
![pbzip2 -9](https://raw.githubusercontent.com/cytopia/mysqldump-secure/master/doc/img/lzma-9.png)
