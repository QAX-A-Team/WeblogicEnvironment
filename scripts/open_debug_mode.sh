#!/bin/bash
echo "==========打开Debug模式=========="
sed '1 adebugFlag=\"true\"' -i /u01/app/oracle/Domains/ExampleSilentWTDomain/bin/setDomainEnv.sh
sed '2 aexport debugFlag' -i /u01/app/oracle/Domains/ExampleSilentWTDomain/bin/setDomainEnv.sh
echo "==========Debug模式已打开=========="