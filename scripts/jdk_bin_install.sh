#!/bin/bash
echo "==========开始安装JDK JDK安装包："$JDK_PKG"=========="
# install JDK
cp $JDK_PKG /install/$JDK_PKG
rm -rf $JDK_PKG
chmod +x /install/$JDK_PKG
/install/$JDK_PKG
mv /jdk* /java

echo "==========JDK安装完成=========="
