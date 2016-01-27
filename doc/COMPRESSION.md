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

When you choose a compression algorithm also keep in mind they have different performances. The following shows a direct comparison between `bzip2 -9` and the multithreaded version `pbzip2 -9` for smaller and medium sized databases.

It was tested on a MacBookPro (2014), Intel Core i7 2.5Ghz (8 cores).

| bzip2 -9 | pbzip2 -9 |
|---------|----------|
| Dumping:  db_01 (433.66 MB) (compressed) 48 sec | Dumping:  db_01 (433.66 MB) (compressed) 14 sec |
| Dumping:  db_02 (166.68 MB) (compressed) 26 sec | Dumping:  db_02 (166.68 MB) (compressed) 9 sec  |
| Dumping:  db_03 (14.39 MB) (compressed) 1 sec   | Dumping:  db_03 (14.39 MB) (compressed) 1 sec   |
| Dumping:  db_04 (39.28 MB) (compressed) 4 sec   | Dumping:  db_04 (39.28 MB) (compressed) 1 sec   |
| Dumping:  db_05 (14.39 MB) (compressed) 1 sec   | Dumping:  db_05 (14.39 MB) (compressed) 0 sec   |
| Dumping:  db_06 (10.71 MB) (compressed) 1 sec   | Dumping:  db_06 (10.71 MB) (compressed) 1 sec   |
| Dumping:  db_07 (44.48 MB) (compressed) 2 sec   | Dumping:  db_07 (44.48 MB) (compressed) 1 sec   |
| Dumping:  db_08 (44.46 MB) (compressed) 2 sec   | Dumping:  db_08 (44.46 MB) (compressed) 1 sec   |
| Dumping:  db_09 (266.39 MB) (compressed) 27 sec | Dumping:  db_09 (266.39 MB) (compressed) 9 sec  |
| Dumping:  db_10 (17.24 MB) (compressed) 2 sec   | Dumping:  db_10 (17.24 MB) (compressed) 1 sec   |
