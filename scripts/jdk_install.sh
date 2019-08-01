#!/bin/bash
echo "==========开始安装JDK JDK安装包："$JDK_PKG"=========="
# install JDK
tar -zxvf $JDK_PKG -C /install
mv /install/jdk* /java

echo "==========JDK安装完成=========="


