# clover-x79-e5-2670-rx588
# OpenCore-华南x79_e5 2670 v1 c2
![image](/OpenCore/docs/OpenCore_with_text_Small.png)
### 介绍

- 黑果爱好者华南金牌x79主板
- macOS Big Sur 
![image](/OpenCore/docs/mac_big_sur.png)

### 软件架构 ###
- 主板具体型号：华南X79蓝色内存槽版本 主板BIOS V2.47

### 安装教程 ###
- 开始安装之前
- 注意bios设置
- 关闭串口 (Serial Port)
- 禁用 VT-d
- 禁用 USB ECHI
- 禁用 CSM
- 开启 USB XHCI
- 开启 Above 4G decoding
- 开启 Hyper-Threading
- 开启 Execute Disable Bit
- 如果bios看不到上面的选项 请刷新bios
- 安装时间选择抹掉磁盘请直接抹掉为apfs格式
![image](/OpenCore/docs/apfs.png)
### bios 刷新请注意 ###
- BIOS ROM型号：EN25F64
- 非常需要注意的是主办pcie插槽旁白呢印有华南金牌x79 2.4x的才可以
- 可用的编程器：CH341A 24 25
- 某宝上可以在20元以下买到以上部件，所以别被骗了
- 1、制作一个DOS启动U盘
- 2、复制clover-x79/BIOS/ROM/x7947.rom 到制作好的dos U盘内，复制clover-x79/BIOS/tool路径内的FPT.EXE 到u盘根目录，启动到dos界面 `fpt -f x7947.rom` 进行刷新中途请勿断电与关闭电脑
- 3、刷新bios后会锁定cpu限制访问区域无法继续通过fpt工具来刷其他bios需要用编程器才可以刷其它bios
### 原版BIOS适配说明 ###
- 应网友要求希望适配原版BIOS来进行安装的需求已经开始适配中
- 预计完成日期Open Core核心正式版0.6.6发布一周内，目前只会推送bate版本
### 文件夹结构说明 ###
- clover-x79`最后维护的存档`
- OpenCore·新的主要维护`
- tools··工具维护`
- docs·未来的说明文档存放路径`
### mac下制作制作安装U盘 ###
- macOS BigSur
- `sudo /Applications/Install\ macOS\ Big\ Sur.app/Contents/Resources/createinstallmedia --volume /Volumes/usbmac` 其中usbmac为你自己的U盘名称
- macOS Catalina
- `sudo /Applications/Install\ macOS\ Catalina.app/Contents/Resources/createinstallmedia --volume /Volumes/usbmac`
- macOS Mojave
- `sudo /Applications/Install\ macOS\ Mojave.app/Contents/Resources/createinstallmedia --volume /Volumes/usbmac`

- [win下创建安装u盘](/OpenCore/docs/windows.md)
### 历史版本官方商店获取地址 ###
- Mojave：*
- [官方原版商店获取地址](https://itunes.apple.com/cn/app/macos-mojave/id1398502828?ls=1&mt=12)

- Catalina：
- [官方原版商店获取地址](https://itunes.apple.com/cn/app/macos-catalina/id1466841314?ls=1&mt=12)
### 维护计划
- 近期将转oc引导
- 四叶草由于驱动不再进行兼容测试不再维护。
- 华南x79蓝色版型配备e5_2670 v1 c2步进的有一点难度需要刷新bios
- 等待一段时间后会增加对应英文说明文档
- 近期将录制视频做一些修复的答疑
#### 配置编辑器地址 ####
- [GenSMBIOS生成三码必备工具](https://github.com/corpnewt/GenSMBIOS)``` git clone https://github.com/corpnewt/GenSMBIOS
    cd GenSMBIOS
    chmod +x GenSMBIOS.command```
- [ProperTree](https://github.com/corpnewt/ProperTree)```git clone https://github.com/corpnewt/ProperTree
python ./ProperTree/ProperTree.command```
- 配置器使用需要安装[python环境](https://www.python.org/downloads/)
- 修复配置器在[MacOS Big Sur macOS 11上面崩溃的问题](https://www.python.org/downloads/mac-osx/)下载最新版本安装后 使用脚本目录内的`buildapp-python3.command`生成app后即可正常使用
- win最少需要在版本win10 1703以上系统安装py后执行`ProperTree.bat`即可运行编辑器
- 请勿使用occ配置器编辑配置文件，因为如果版本错误会损坏配置文件导致各种异常
### 发布版本说明 ###
#### v0001 四叶草r5126首次项目发布版本
#### v-os10.15.7 四叶草修正版本
#### v0.6.4 正式转Open Core
- OpenCore 0.6.4
- 支持Mac10.15.7升级MacOS big sur
- 由于e5 2670 v1 c2缺少一个指令集导致启动黑屏问题已经修复（非e5 2670请将hfs驱动换成uefi的）
- 版本制作了8档2670的cpu变频显卡免驱，安装前请重新生成三码，修改rom为自己的网卡mac地址
- bios请在四叶草存档目录中获取-刷新命令 `fpt -f xxx.rom`
- 刷新bios后只需要关闭csm 兼容改为纯uefi引导即可-安装完成后驱动完美
- 需要使用Wi-Fi和蓝牙请参考相关免驱硬件这里不做任何测试
- Open Core维护周期为每个正式版发布后进行维护以及日常驱动支持更新
- 该库安装测试环境均为官方正式版OS与bate OS测试通过后发布
#### [v0.6.5 Open Core](https://gitee.com/yaming-network/clover-x79-e5-2670-rx588/attach_files/575697/download/OpenCore-0.6.5.zip)
- WhateverGreen 升级到1.4.6
- AppleALC 升级到1.5.6
- HibernationFixup 升级到1.3.9
- CPUFriend 升级到1.2.3
- 新增测试显卡七彩虹gtx760 铭瑄770 （已测试通过完美MacOS big sur 11.2 bate版依然免驱）
- 新增硬件博通 Wi-Fi蓝牙9426 新版测试
- USB3.0驱动是经过定制的请勿放入其它usb万能注入驱动使用我的efi无需进行其它操作基本没问题3.0接口5g速度
- 如果发现RealtekRTL8111 千兆网卡有断流情况请下载2.2.2版本替换掉内含的2.3.0版本
#### [v0.6.6 Open core ](https://gitee.com/yaming-network/clover-x79-e5-2670-rx588/attach_files/587278/download/v0.6.6%20Open%20Core.zip)
- 重点更新驱动版本
- 已知问题Mac big sur 11.2bate版本中cpu变频出现故障没有变频效果，暂时请勿升级最新bate版（预计修复时间在正式版发布后一周）
- 配置文件中添加facetim通话，短信，固定网卡实列在配置文件上 只需修改为自己对应en0网卡pcie地址即可完美修复
- 修复一个异常导致使用中电源崩溃的严重问题建议所有使用该efi用户都升级到当前版本
- 升级后请将配置文件中三码重新生成，ROM码修改为自己对应en0网卡Mac地址
#### [v0.6.6 Open core_beta_02 变更](/OpenCore/docs/Changelog.md)

##### 仓库内默认最新代码说明
- 新增SMBIOS S 测试
- 已知问题直接安装可能会出现板载声卡不识别
- 已知免驱蓝牙Wi-Fi可能会出现不识别（但是其它网友使用1650cpu的并没有出现）
- 已知添加图形界面后黑屏（使用1650cpu的并没有出现问题）
- 2021年1月19日，对新版本中预计发布的OpenHfsPlus驱动进行兼容测试
- 对opencore0.6.6开发版中的efi驱动进行大版本变更测试 
- 预计新版本发布时间在正式版发布一周内

### [变更日志](/OpenCore/docs/Changelog.md) ###
### 对应自维护机型地址 ###
- [技嘉_b75m_d3v+e3_1230_v2](https://gitee.com/yaming-network/OpenCore-GA-b75)
- [华南x79_e5_2670_c2_v1](https://gitee.com/yaming-network/clover-x79-e5-2670-rx588)
- [github同步地址华南x79_e5_2670c2](https://github.com/wy414012/huaNan_x79_e5_2670_v1_c2)