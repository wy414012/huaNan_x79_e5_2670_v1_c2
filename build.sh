#!/bin/bash

name="OpenCore-"
srcFile="/"
srcPath="./OpenCore"
targetPath="./build"
version=0.8.3
date=$(date +%Y%m%d)
cpu=-REL-

if [ -d $srcPath/$srcFile ];then
echo "打包目录存在"

if [ -d $targetPath ];then
tar -zcvf  $targetPath/$name$version$cpu$date.tar.gz --exclude=.DS_Store $srcPath/$srcFile
else
echo "打包目录不存在"
fi
echo "打包完成开始生成sha256sum码"
fi
if [ -d $targetPath ];then
md5sum $targetPath/$name$version$cpu$date.tar.gz >$targetPath/$name$version$cpu$date.tar.gz.sha256sum.txt
else
echo "存放目录不存在"
fi
