#!/bin/bash

name="OpenCore-"
srcFile="EFI"
srcFile1="EFI"
srcPath="./OpenCore/V1版本U用"
srcPath1="./OpenCore/V2版本U用"
targetPath="./build"
version=0.7.3
date=$(date +%Y%m%d)
cpu=1-
cpu1=2-
if [ -d $srcPath/$srcFile ];then
echo "打包目录存在"
if [ -d $srcPath1/$srcFile1 ];then
echo "打包目录存在"
if [ -d $targetPath ];then
tar -zcvf  $targetPath/$name$version$cpu$date.tar.gz --exclude=.DS_Store $srcPath/$srcFile
if [ -d $targetPath ];then
tar -zcvf  $targetPath/$name$version$cpu1$date.tar.gz --exclude=.DS_Store $srcPath1/$srcFile1
echo "打包完成开始生成sha256sum码"
if [ -d $targetPath ];then
md5 $targetPath/$name$version$cpu$date.tar.gz >$targetPath/$name$version$cpu$date.tar.gz.sha256sum.txt
if [ -d $targetPath ];then
md5 $targetPath/$name$version$cpu1$date.tar.gz >$targetPath/$name$version$cpu1$date.tar.gz.sha256sum.txt
else
echo "打包目录不存在"
fi
else
echo "存放目录不存在"
fi
fi
fi
fi
fi
