#!/bin/bash

export MW_HOME=/u01/app/oracle/middleware
export WLS_HOME=$MW_HOME/wlserver
export WL_HOME=$WLS_HOME
export JAVA_HOME=/java
export PATH=$JAVA_HOME/bin:$PATH


echo "==========开始创建Domain=========="
echo '#!/usr/bin/python
import os, sys
readTemplate("/u01/app/oracle/middleware/wlserver/common/templates/domains/wls.jar")
cd("/Security/base_domain/User/weblogic")
cmo.setPassword("qaxateam01")
cd("/Server/AdminServer")
cmo.setName("AdminServer")
cmo.setListenPort(7001)
cmo.setListenAddress("0.0.0.0")
writeDomain("/u01/app/oracle//Domains/ExampleSilentWTDomain")
closeTemplate()
exit()' > create_domain_7001.py

. $WLS_HOME/server/bin/setWLSEnv.sh
java weblogic.WLST create_domain_7001.py
echo "==========Domain创建完成=========="


