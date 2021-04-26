#!/bin/bash
exec > telnetall.txt
echo "<--table Telnetall_3thrd starts-->"
echo "3rd_party= result"
echo  "giamngheo.mic.gov.vn 80
gateway.vnpt-ca.vn 80
convert.ecabinet.vn 80
fcm.googleapis.com 80
convert.ecabinet.vn 80
123.30.156.56 80
ocsp.vnpt-ca.vn 80
ocsp.viettel-ca.vn 80
ocsp.bkavca.vn 80
ocsp.newca.vn 80
ocsp.safecert.com.vn 80
ocsp.smartsign.com.vn 80
ocsp.fis.com.vn 80
ocsp.efyca.vn 80
ocsp.ca.gov.vn 80
123.31.40.45 80
14.225.228.137 80
14.225.228.136 80
113.164.237.186 80
123.30.156.56 80
123.30.156.54 80
216.58.199.14 80
14.225.12.25 80
giamngheo.mic.gov.vn 80
giamngheo.mic.gov.vn 443
gateway.vnpt-ca.vn 443
fcm.googleapis.com 443
ocsp.viettel-ca.vn 443
ocsp.bkavca.vn 443
ocsp.safecert.com.vn 443
ocsp.smartsign.com.vn 443
ocsp.efyca.vn 443
ocsp.ca.gov.vn 443
123.31.40.45 443
14.225.228.137 443
14.225.228.136 443
113.164.237.186 443
123.30.156.56 443
123.30.156.54 443
216.58.199.14 443
10.159.132.79 1521
10.159.132.80 1521" | (
  TCP_TIMEOUT=3
  while read host port; do
    (CURPID=$BASHPID;
    (sleep $TCP_TIMEOUT;kill $CURPID) &
    exec 3<> /dev/tcp/$host/$port
    ) 2>/dev/null
    case $? in
    0)
      echo $host $port = open;;
    1)
      echo $host $port = closed;;
    143) # killed by SIGTERM
       echo $host $port = timeouted;;
     esac
  done
  ) 2>/dev/null # avoid bash message "Terminated ..."
echo "<--table Telnetall_3thrd ends-->"