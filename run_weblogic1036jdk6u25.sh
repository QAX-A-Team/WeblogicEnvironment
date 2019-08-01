#!/bin/bash
docker rm `docker ps -a | grep weblogic | awk '{print $1}'` -f
docker rmi -f  `docker images | grep 'weblogic' | awk '{print $3}'` 
docker build --build-arg JDK_PKG=jdk-6u25-linux-x64.bin --build-arg WEBLOGIC_JAR=wls1036_generic.jar  -t weblogic1036jdk6u25 .
docker run -d -p 7001:7001 -p 8453:8453 -p 5556:5556 --name weblogic1036jdk6u25 weblogic1036jdk6u25
rm -rf ./middleware
mkdir ./middleware
docker cp weblogic1036jdk6u25:/u01/app/oracle/middleware/modules ./middleware/
docker cp weblogic1036jdk6u25:/u01/app/oracle/middleware/wlserver ./middleware/