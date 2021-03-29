# clover-x79-e5-2670-rx588
# OpenCore-华南x79_e5 2670 v1 c2
![image](/OpenCore/docs/OpenCore_with_text_Small.png)
### 介绍

- 黑果爱好者华南金牌x79主板
- macOS Big Sur 
![image](/OpenCore/docs/mac_big_sur.png)

- macOS Big Sur正常升级11.2.3 
![image](/OpenCore/docs/11.2.3.png)

### 软件架构 ###
- 主板具体型号：华南X79蓝色内存槽版本 主板BIOS V2.47
### 注意事项 ###
- 新开企鹅交流群感谢各位关注为各位处理cpu变频问题 
- 千人群号591391580
### 安装教程 ###
- 开始安装之前
- 注意bios设置
- 禁用 CSM
- 安装时间选择抹掉磁盘请直接抹掉为apfs格式
- 原厂BIOS在0.6.7版本中已经支持 无需做任何设置均可直接安装
![image](/OpenCore/docs/apfs.png)
# 文件夹结构说明
类别 | 描述
--- | ---
**clover-x79** | 最后维护的存档
**OpenCore** | 新的主要维护
**tools** | 工具维护
**docs** | 未来的说明文档存放路径
**patch** | 补丁配置单独目录
---
# mac下制作制作安装U盘
系统版本 | 使用的命令 | 备注
--- | --- | ---
**macOS BigSur** | sudo /Applications/Install\ macOS\ Big\ Sur.app/Contents/Resources/createinstallmedia --volume /Volumes/usbmac | 其中usbmac为你自己的U盘名称
**macOS Catalina** | sudo /Applications/Install\ macOS\ Catalina.app/Contents/Resources/createinstallmedia --volume /Volumes/usbmac | 
**macOS Mojave** | sudo /Applications/Install\ macOS\ Mojave.app/Contents/Resources/createinstallmedia --volume /Volumes/usbmac | 

- [win下创建安装u盘](/OpenCore/docs/windows.md)
### 历史版本官方商店获取地址 ###
- Mojave：*
- [官方原版商店获取地址](https://itunes.apple.com/cn/app/macos-mojave/id1398502828?ls=1&mt=12)

- Catalina：
- [官方原版商店获取地址](https://itunes.apple.com/cn/app/macos-catalina/id1466841314?ls=1&mt=12)
### 维护计划
- 四叶草由于驱动不再进行兼容测试不再维护。
- open core每次稳定版发布一周内推送新版
- [open core自行配置发布版下载地址](https://gitee.com/yaming-network/OpenCorePkg/releases/)
#### 配置编辑器地址 ####
- [GenSMBIOS生成三码必备工具](https://gitee.com/yaming-network/GenSMBIOS)``` git clone https://gitee.com/yaming-network/GenSMBIOS
    cd GenSMBIOS
    chmod +x GenSMBIOS.command```
- [ProperTree](https://gitee.com/yaming-network/ProperTree)```git clone https://gitee.com/yaming-network/ProperTree
python ./ProperTree/ProperTree.command```
- 配置器使用需要安装[python环境](https://www.python.org/downloads/)
- 修复配置器在[MacOS Big Sur macOS 11上面崩溃的问题](https://www.python.org/downloads/mac-osx/)下载最新版本安装后 使用脚本目录内的`buildapp-python3.command`生成app后即可正常使用
- win最少需要在版本win10 1703以上系统安装py后执行`ProperTree.bat`即可运行编辑器
- 请勿使用occ配置器编辑配置文件，因为如果版本错误会损坏配置文件导致各种异常
### [版本说明日志点击查看](/Changelog.md) ###
# ACPI 内对应ssdt说明
名称 | 作用 | 是否必须
--- | --- | ---
**SSDT-UNC.aml** | 所有X99和许多X79板都需要这个SSDT，它专门禁用ACPI中的未使用设备，随后IOPCIFamily不会内核恐慌。这对于最终用户来说只需要很少的配置. | 是
**SSDT-SBUS-MCHC** | 这一部分涉及修复 macOS 中对 AppleSMBus 的支持，什么是 AppleSMBus？那么这个主要处理系统管理总线，它有很多功能,验证是否正常工作指令 | 否
**SSDT-PMC.aml** | 所有“真正的”300系列主板（不包括Z370），它特别带回了NVRAM支持，对最终用户只需要很少的配置 | 是
**SSDT-HPET.aml** | 来自三叶草的花式热补丁，如FixIPIC、FixTMR、FixRTC、FixHPET等 | 是
**SSDT-PLUG.aml** | SSDT-PLUG的目的是允许内核的XCPM（XNU的CPU电源管理）管理我们的CPU电源管理. | 是
**SSDT-EC.aml** | SSDT-EC/USBX的目的是几件事：在台式机上，EC（或更广为人知的是嵌入式控制器）与AppleACPIEC驱动程序不兼容，为了绕过这一点，我们在运行macOS时禁用此设备AppleBusPowerController将寻找一个名为EC的设备，因此我们希望为这个kext创建一个假设备以加载到AppleBusPowerController还需要USBX设备为Skylake及更新机型提供USB电源属性，因此我们将将此设备与EC修复程序捆绑在一起在笔记本电脑上，EC用于热键和电池，因此禁用这并不理想。问题是我们的EC名称不兼容，因此我们将创建一个简单的“假”EC设备，以满足苹果 | 是
**SSDT-USB-Reset.aml** | USB端口固定 | 是
**SSDT-CPUM** | cpu变频修正 | 是
**SSDT-SSDT-IMEI.aml** | 屏蔽一个不规范的pci设备但是目前暂时还是没有屏蔽到，等待修正后将不在需要npci=0x2000参数 ｜ 否
---
- 验证SSDT-SBUS-MCHC是否正常工作时指令```kextstat | grep -E "AppleSMBusController|AppleSMBusPCI"```
- ACPI 文件夹内的ssdt除非板型完全一致才可以直接使用以免引起不必要的异常问题
- 尽量自行生成相同的ssdt
- 生成工具使用SSDTTime
- 使用方法安装py运行环境在win下生成自己主板专用的 ` git clone https://gitee.com/yaming-network/SSDTTime.git ` 替换到efi里面即可 
### CPU变频修复 ###
#### 开始修复:
- Mac下使用ssdtPRGen.sh生成专属的cpu变频文件 
- 使用之前请打开终端先安装```xcode-select --install``` 命令行开发者工具
- 执行如下命令```curl -o ~/ssdtPRGen.sh https://raw.githubusercontent.com/Piker-Alpha/ssdtPRGen.sh/Beta/ssdtPRGen.sh```
- ```wc -c ssdtPRGen.sh```
- ```chmod +x ~/ssdtPRGen.sh```
- 多次运行```sudo ./ssdtPRGen.sh```直到生成正确的ssd
- 放入oc对应目录中
- 将/OpenCore/tools/oc_cpu_patch.plist中的补丁添加到对应的oc配置文件 acpi中 重启后即完整修复
- 注意不可以先进行打补丁，除非是在已有Cpu ssdt才可以先进行补丁操作
- 定义0.7.0发布版本中CPU变频ssdt名称为SSDT-CPUM.aml
- 对于v2版本cpu中将会默认开启图形引导界面
### Fusion Drive（融合硬盘技术) ###
#### 创建方法
- 1. 列出所有磁盘:

- ```diskutil list```

- 2. 建立一块 fusion drive:

- ```diskutil cs create "Cheney Fusion Drive" disk0 disk1```

- 建立完成后，它会告诉你一个uuid，复制下来。

- 3. 给这个 fusion drive 分区:

- ```diskutil cs createVolume BDF819F4-06C0-4D49-943A-1A23E8B20928 jhfs+ "Macintosh FD" 100%```

- 到这里你可以发现所有磁盘变成一块磁盘了 然后正常的使用磁盘工具抹盘安装即可了！
- 注意要使用该技术必须在安装时候进行该操作，操作后不可拆分，如果拆分会损失数据，请自行选择是否使用！

### 对应自维护机型地址 ###
- [技嘉_b75m_d3v+e3_1230_v2](https://gitee.com/yaming-network/OpenCore-GA-b75)
- [华南x79_e5_2670_c2_v1](https://gitee.com/yaming-network/clover-x79-e5-2670-rx588)
- [github同步地址华南x79_e5_2670c2](https://github.com/wy414012/huaNan_x79_e5_2670_v1_c2)
# 鸣谢支持：
名称 | 日期 | 金额 | 渠道
--- | --- | --- | ---
**黄昏** | 2021.3.23 | 9.9元 | 微信红包
**Pteromyini** | 2021.3.29 | 9.9元 | QQ红包
---