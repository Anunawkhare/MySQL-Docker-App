#!/bin/bash
mysqladmin ping -uroot -p"$MYSQL_ROOT_PASSWORD" --silent
exit $?
