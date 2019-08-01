#!/bin/bash
echo "==========开始安装Weblogic Weblogic安装包："$WEBLOGIC_JAR"=========="
v_software=$WEBLOGIC_JAR

#install Weblogic
mkdir -p /u01/app/oracle/middleware
mkdir -p /u01/app/oracle/config/domains
mkdir -p /u01/app/oracle/config/applications
mkdir -p /u01/software/
chown -R oracle:oinstall /u01
chmod -R 775 /u01/

export MW_HOME=/u01/app/oracle/middleware
export WLS_HOME=$MW_HOME/wlserver
export WL_HOME=$WLS_HOME
export JAVA_HOME=/java
export PATH=$JAVA_HOME/bin:$PATH

echo '[ENGINE]
Response File Version=1.0.0.0.0
[GENERIC]
ORACLE_HOME=/u01/app/oracle/middleware
INSTALL_TYPE=Complete with Examples
MYORACLESUPPORT_USERNAME=example@example.com
MYORACLESUPPORT_PASSWORD=examplepassword01
DECLINE_SECURITY_UPDATES=true
SECURITY_UPDATES_VIA_MYORACLESUPPORT=false
PROXY_HOST=
PROXY_PORT=
PROXY_USER=
PROXY_PWD=
COLLECTOR_SUPPORTHUB_URL=' > /u01/software/wls.rsp

echo 'inventory_loc=/u01/app/oraInventory
inst_group=oinstall' > /u01/software/oraInst.loc

su - oracle -c "$JAVA_HOME/bin/java -Xmx1024m -jar /$v_software -silent -responseFile /u01/software/wls.rsp -invPtrLoc /u01/software/oraInst.loc"

. $WLS_HOME/server/bin/setWLSEnv.sh
echo "==========Weblogic安装完成 请查看版本输出=========="
java weblogic.version

