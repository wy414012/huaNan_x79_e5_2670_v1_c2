#!/bin/bash

name="OpenCore-"
src_file="/OpenCore"
src_path="./OpenCore"
target_path="./build"
version="0.8.9"
date=$(date +%Y%m%d)
cpu="-REL"

if [ -d "$src_path/$src_file" ]; then
    echo "打包目录存在"
    if [ -d "$target_path" ]; then
        tar -zcvf "$target_path/$name$version$cpu$date.tar.gz" --exclude=.DS_Store "$src_path/$src_file"
    else
        echo "打包目录不存在"
    fi
    printf "打包完成，开始生成 sha256sum 码\n"

    if [ -d "$target_path" ]; then
        md5sum "$target_path/$name$version$cpu$date.tar.gz" > "$target_path/$name$version$cpu$date.tar.gz.sha256sum.txt"
    else
        echo "存放目录不存在"
    fi
fi
