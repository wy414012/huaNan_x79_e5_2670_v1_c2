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
### bios 刷新请注意 ###
- BIOS ROM型号：EN25F64
- 非常需要注意的是主办pcie插槽旁白呢印有华南金牌x79 2.4x的才可以
- 可用的编程器：CH341A 24 25
- 某宝上可以在20元以下买到以上部件，所以别被骗了
- 1、制作一个DOS启动U盘
- 2、复制clover-x79/BIOS/ROM/x7947.rom 到制作好的dos U盘内，复制clover-x79/BIOS/tool路径内的FPT.EXE 到u盘根目录，启动到dos界面 `fpt -f x7947.rom` 进行刷新中途请勿断电与关闭电脑
- 3、刷新bios后会锁定cpu限制访问区域无法继续通过fpt工具来刷其他bios需要用编程器才可以刷其它bios

### 文件夹结构说明 ###
- clover-x79`最后维护的存档`
- OpenCore·新的主要维护`
-- tools··工具维护`
-- docs·未来的说明文档存放路径`
### mac下制作制作安装U盘 ###
- macOS BigSur
- `sudo /Applications/Install\ macOS\ Big\ Sur.app/Contents/Resources/createinstallmedia --volume /Volumes/usbmac` 其中usbmac为你自己的U盘名称
- macOS Catalina
- `sudo /Applications/Install\ macOS\ Catalina.app/Contents/Resources/createinstallmedia --volume /Volumes/usbmac`
- macOS Mojave
- `sudo /Applications/Install\ macOS\ Mojave.app/Contents/Resources/createinstallmedia --volume /Volumes/usbmac`


### 历史版本官方商店获取地址 ###
- Mojave：*
- [官方原版商店获取地址](https://itunes.apple.com/cn/app/macos-mojave/id1398502828?ls=1&mt=12)

- Catalina：
- [官方原版商店获取地址](https://itunes.apple.com/cn/app/macos-catalina/id1466841314?ls=1&mt=12)
### 维护计划
- 近期将转oc引导
- 四叶草由于驱动不再进行兼容测试不再维护。
- 华南x79蓝色版型配备e5_2670 v1 c2步进的有一点难度需要刷新bios
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
### [变更日志](/OpenCore/docs/Changelog.md) ###