#!/bin/bash

name="OpenCore-"
src_file="/"
src_path="./OpenCore"
target_path="./build"
version=$(grep OPEN_CORE_VERSION ./VERsion | sed 's/.*"\(.*\)".*/\1/' | grep -E '^[0-9.]+$')

if [ -d "$src_path/$src_file" ]; then
    printf "打包目录存在"
    if [ -d "$target_path" ]; then
        tar -zcvf "$target_path/$name$version-REL.tar.gz" --exclude=.DS_Store "$src_path/$src_file"
    else
        printf "打包目录不存在"
    fi
    printf "打包完成，开始生成 sha256sum 码\n"

    if [ -d "$target_path" ]; then
        md5sum "$target_path/$name$version-REL.tar.gz" > "$target_path/$name$version-REL.tar.gz.sha256sum.txt"
    else
        printf "存放目录不存在"
    fi
fi
