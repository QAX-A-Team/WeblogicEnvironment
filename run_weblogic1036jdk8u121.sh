#!/bin/bash
docker rm `docker ps -a | grep weblogic | awk '{print $1}'` -f
docker rmi -f  `docker images | grep 'weblogic' | awk '{print $3}'` 
docker build --build-arg JDK_PKG=jdk-8u121-linux-x64.tar.gz --build-arg WEBLOGIC_JAR=wls1036_generic.jar  -t weblogic1036jdk8u121 .
docker run -d -p 7001:7001 -p 8453:8453 -p 5556:5556 --name weblogic1036jdk8u121 weblogic1036jdk8u121
rm -rf ./middleware
mkdir ./middleware
docker cp weblogic1036jdk8u121:/u01/app/oracle/middleware/modules ./middleware/
docker cp weblogic1036jdk8u121:/u01/app/oracle/middleware/wlserver ./middleware/