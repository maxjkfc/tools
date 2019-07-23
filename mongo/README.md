# Mongo Backup / Restore Tools


## mongo.env
```
# Host : write your mongo host and port
HOST="192.168.31.226:27017" 
# User : write your user 
USER=""
# Password : write you user
PASSWORD=""
# Database : write you database
DATABASE=""
# DIR_PATH : write you work path
DIR_PATH="."
# DIR : write you want to store dir
DIR="backup"
# MONGO_VERSION : write you mongo version
MONGO_VERSION="4.0"

```


```
cd mongo

vim mongo.env # set you mongo config

sh mtools.sh backup # backup the mongo data
sh mtools.sh restore # restore the mongo data

```
