#!/bin/bash
serv=kannel
DATE_EXEC="$(date "+%d %b %Y %H:%M")"
sstat=stopped
service $serv status | grep -i 'running\|stopped' | awk '{print $3}' | while read output;
do
echo $output
if [ "$output" == "$sstat" ]; then
    service $serv start
    echo "$serv service is restarted at $DATE_EXEC" >> /home/mynhan/kannel/kannelrestartlog.txt
    else
    echo "$serv service is running"
    fi
done