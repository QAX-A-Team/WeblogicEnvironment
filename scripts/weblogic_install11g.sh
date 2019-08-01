#!/bin/bash
echo "==========开始安装Weblogic Weblogic安装包："$WEBLOGIC_JAR"=========="
v_software=$WEBLOGIC_JAR

#install Weblogic
mkdir -p /u01/app/oracle/middleware
mkdir -p /u01/app/oracle/config/domains
mkdir -p /u01/app/oracle/config/applications
chown -R oracle:oinstall /u01
chmod -R 775 /u01/

export MW_HOME=/u01/app/oracle/middleware
export WLS_HOME=$MW_HOME/wlserver
export WL_HOME=$WLS_HOME
# Set to the appropriate JAVA_HOME.
export JAVA_HOME=/java
export PATH=$JAVA_HOME/bin:$PATH

echo '<?xml version="1.0" encoding="UTF-8"?>
   <bea-installer> 
     <input-fields>
       <data-value name="BEAHOME" value="/u01/app/oracle/middleware" />
       <data-value name="WLS_INSTALL_DIR" value="/u01/app/oracle/middleware/wlserver" />
       <data-value name="COMPONENT_PATHS"
        value="WebLogic Server/Core Application Server|WebLogic Server/Administration Console|WebLogic Server/Configuration Wizard and Upgrade Framework|WebLogic Server/Web 2.0 HTTP Pub-Sub Server|WebLogic Server/WebLogic JDBC Drivers|WebLogic Server/Third Party JDBC Drivers|WebLogic Server/WebLogic Server Clients|WebLogic Server/WebLogic Web Server Plugins|WebLogic Server/UDDI and Xquery Support|Oracle Coherence/Coherence Product Files" />
       <data-value name="INSTALL_NODE_MANAGER_SERVICE" value="yes" />
       <data-value name="NODEMGR_PORT" value="5556" />
       <data-value name="INSTALL_SHORTCUT_IN_ALL_USERS_FOLDER" value="no"/>
       <data-value name="LOCAL_JVMS" value="/java"/>
   </input-fields> 
</bea-installer>' > silent.xml

$JAVA_HOME/bin/java -Xmx1024m -jar $v_software -mode=silent -silent_xml=/silent.xml

. $WLS_HOME/server/bin/setWLSEnv.sh
echo "==========Weblogic安装完成 请查看版本输出=========="
java weblogic.version

