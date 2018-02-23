#!/bin/bash

dirName=`dirname ${PWD}`
# n: nginx, haproxy ... etc
n=`basename ${dirName}`
# t: standalone-plain ... etc
t=`basename ${PWD}`

case $t in
  standalone-plain-http)
    p="-p 7080:7080"
    ;;
  standalone-plain-raw)
    p="-p 7080:7080 -p 7081:7081"
    ;;
  standalone-secure-http)
    p="-p 7443:7443"
    ;;
  standalone-secure-raw)
    p="-p 7443:7443 -p 7481:7481"
    ;;
  cluster-plain-http)
    p="-p 17060:17060 -p 17070:17070 -p 17071:17071"
    ;;
  cluster-plain-raw)
    p="-p 18080:18080 -p 18081:18081 -p 18091:18091"
    ;;
  cluster-secure-http)
    p="-p 18460:18460 -p 18470:18470 -p 18471:18471"
    ;;
  cluster-secure-http-binary)
    p="-p 18461:18461 -p 18475:18475 -p 18476:18476"
    ;;
  cluster-secure-raw)
    p="-p 18443:18443 -p 18481:18481 -p 18491:18491"
    ;;
esac

docker run -d --name ${n}_${t} ${p} --add-host nifi0:192.168.99.1 ${n}:${t}
