#!/bin/bash
# Fetch names from mysql
sleep 10
mysql -h 127.0.0.1 -u $DB_USER -p$DB_PASSWORD -D jelly -e "select name from employee;" | grep -v name > names.txt

# Script to put the names from mysql output into a queue
./send.py

sleep 100d
