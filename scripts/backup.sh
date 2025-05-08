#!/bin/bash
DATE=$(date +%Y%m%d_%H%M%S)
docker exec mysql-prod sh -c 'exec mysqldump --all-databases -uroot -p"$MYSQL_ROOT_PASSWORD"' > backup_${DATE}.sql
gzip backup_${DATE}.sql
