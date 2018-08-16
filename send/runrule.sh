#!/bin/bash
# Fetch names from mysql
sleep 10
mysql -h 127.0.0.1 -u $DB_USER -p$DB_PASSWORD -D jelly -e "select name from employee;" | grep -v name > names.txt

# Script to put the names from mysql output into a queue
./send.py

sleep 10

# Count the numbet of message
JOB=`wc -w names.txt | awk '{print$1}'`

# Trigger Jenkins JOBS - Batch Jobs to consume messages
curl -v -X POST http://<JenkinsURL>/job/<JOBNAme>/build --data token=batchjob --data-urlencode json='{"parameter": [{"name":"JOB", "value":'$JOB'}]}'

sleep 100d
