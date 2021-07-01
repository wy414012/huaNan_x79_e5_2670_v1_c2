#!/bin/bash

name="OpenCore-"
srcFile="EFI"
srcFile1="EFI"
srcPath="./OpenCore/V1版本U用"
srcPath1="./OpenCore/V2版本U用"
targetPath="./build"
version=0.7.2-beta1-V
cpu=1版本
cpu1=2版本
if [ -d $srcPath/$srcFile ];then
echo "打包目录存在"
if [ -d $srcPath1/$srcFile1 ];then
echo "打包目录存在"
if [ -d $targetPath ];then
tar -zcvf  $targetPath/$name$version$cpu.tar.gz --exclude=.DS_Store $srcPath/$srcFile
if [ -d $targetPath ];then
tar -zcvf  $targetPath/$name$version$cpu1.tar.gz --exclude=.DS_Store $srcPath1/$srcFile1
echo "打包完成开始生成sha256sum码"
if [ -d $targetPath ];then
sha256sum $targetPath/$name$version$cpu.tar.gz >$targetPath/$name$version$cpu.tar.gz.sha256sum.txt
if [ -d $targetPath ];then
sha256sum $targetPath/$name$version$cpu1.tar.gz >$targetPath/$name$version$cpu1.tar.gz.sha256sum.txt
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
