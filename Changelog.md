华南x79 ver.2.0.1主板变更日志
==========================
### 0.8.0 ###
- 添加更多日志保存支持
- 修复不能更改机型的bug
- 验证12.3.1下开普勒核心驱动注入
- 更新unc设备ssdt示范代码


### 0.7.9 ###
- 更新核心
- 为了macOS12支持我们现在放弃了对`cputsync`使用，改`VoodooTSCSync`保障正确安装使用，目前暂时不保证能完美使用，只保证安装
- 添加功能解锁`FeatureUnlock.kext`,最低启用内核为`21.0.0=macOS12.0`
- 更新`RestrictEvents.kext`,修复对10.9-11.x中的支持bug
- 将TSc同步驱动更换为`VoodooTSync重构版本`定义名称：`CpuTSCSync.kext`版本号`1.5.1`
- 修复机型固件中的一个错误
- 处理器温度监控`SMCProcessor.kext`与超级IO芯片支持`SMCSuperIO.kext`回归
- 移除不在需要的`RestrictEvents.kext`限制异常进程驱动
- 整理文档与驱动核心
- 将四叶草存档测地移除出库内
- 添加`Sandy Bridge-E Power Management`补丁命名为`Sandy Bridge-E PM`
- 测试`VS2022`构建
### 0.7.8 ###
- 更新网卡驱动，解决在11.6.3beta中出现的断流情况
- 更新了`ocvalidate`以警告不安全`DmgLoading`的安全`SecureBootModel`(在运行时已经不允许）
- 修复了`AudioDxe`在最近更新后不会禁用未使用的频道
- 允许增益跟踪旧 macOS 上的操作系统音量，而无需`SystemAudioVolumeDB`
- 修复了验证密码时不支持鼠标的崩溃
- 固定 AppleInternal CSR 位被设置为ProvideCustomSlide启用
- 添加了对引导入口协议条目的支持`.contentFlavour`和文件，包括 OpenLinuxBoot.contentDetails
- 向 OpenLinuxBoot添加LINUX_BOOT_ADD_RW了标志以支持例如 EndeavourOS
- 如果需要，向 OpenLinuxBoot添加`flags+=`和`flags-=`参数以简化设置驱动程序标志
- LINUX_BOOT_USE_LATEST修复了清除标志时的`OpenLinuxBoot`条目名称歧义
- 更新了 SMBIOS 和其余部分的内置固件版本
- 修复了部分（重新）安装`Linux`发行版的 OpenLinuxBoot 崩溃
- 改进了格式错误的`PE`图像文件解析的鲁棒性
### 0.7.7 ###
- 修复了入口点寄存器损坏导致的罕见崩溃
- 移除不在需要的EC插头补丁，只保留USB端口重置补丁
- 添加对于部分机器缺失的HDEF控制桥
- 将对应版本开机音频驱动添加到目录
- 为32纳米制程CPU添加了macOS12的支持测试补丁
- 当`AudioSupport`启用，`AudioDevice`必须是空的或有效的路径。
- 当`AudioSupport`启用，`AudioOutMask`必须是非零。
- 实现多声道（例如低音+主扬声器；扬声器+耳机）UEFI 声音配置 AudioOutMask
- 修复了当 Nvidia HDA 音频存在时 AudioDxe 启动停止的问题
- 解决了 AudioDxe 在某些固件上的 Windows 中禁用声音的问题
- 在内置 AppleEvent 实现中添加了指针轮询周期调整
- 在内置 AppleEvent 实现中添加了指针设备列表调整
- 添加了音频 GPIO 和 VREF 处理以在更多 Apple 硬件上支持 UEFI 声音
- 更新了音频输出通道检测以支持更多 Apple 硬件上的 UEFI 声音
- 更新核心到稳定版
- 移除Misc-->BlessPverride 中的示范条目`#\EFI\win\Microsoft\Boot\bootmgfw.efi`
### 0.7.6 ###
- 新增`UIScale`设置项
- 将辅助菜单默认更改为隐藏`Misc->boot->HideAuxiliary=true`false=不隐藏
- 更新`Lilu.kext`修复10.15下导致内核崩溃的bug
- 移除不在需要的`SSDT-PLUG`CPU插头补丁
- 添加主题`png`图片转`icns`工具
- 将辅助菜单`Misc->boot->HideAuxiliary=false`恢复为默认不隐藏
- 对于USB3.0缺失XHCI控制桥请使用`SSDT-XHCI-PEXN.aml`补丁添加到acpi内启用即可解决
- 将系统驱动加载情况查看工具`acdtinfo`添加到文档目录中，用法`./acdtinfo`
- 优化`OpenCanopy`逻辑减少图形撕裂
- 修复了在 `ScanPolicy` 中使用逻辑单元处理PCI设备路径
- 同步新增配置参数
- 更新机型固件数据
- 移除`FeatureUnlock.kext`功能解锁驱动需要请自行添加。
### 0.7.5 ###
- 将OpenCanopy资源读取路径层级降低遍历目录，优化层级
- 添加了github自动打包CI
- 添加`SSDT-PLUG.aml`补丁
- 完整更新全机型内置固件数据
- 更新`SSDT-PLUG.dsl`示范代码
### 0.7.4 ###
- 将机型调整至默认iMacPro1,1
- ```CpuTscSync.kext```当前仓库内驱动在macOS12下支持良好，请勿更新该驱动
- 为方便与团队版驱动进行区分，对构建的驱动进行了标识修改。
- 清理文档
- ```UEFI -> Quirks -> ReleaseUsbOwnership -> True```
- 添加缺失```XHCI```控制桥描述修补示例添加到SSDT参考目录
- 重写UNC设备屏蔽SSDT
- 关闭USB仿真传递，经过测试在部分版型上会造成内核恐慌
- 去除部分旧版10.9之前系统支持
- 关于电源五项，在没有`机械硬盘`使用的情况下将不会出现五项
- 删除`Background.icns`默认背景图
- 由于开机音频链接速率过慢，删除音频资源
### 0.7.3 ###
- 同步版本日志
- 正式添加版本配置文件合规性检查器，该工具每个版本的配置文件中附带，用于检查config是否有损坏
- 推动核心正式进入0.7.3的测试工作中
- 降低apfs值，解决最后一分钟磁盘转换失败的bug
- 添加了EFI内文件详细结构
- 将cpu型号标签更改为自动识别
- 启用appleSmcIO=true
- Add AppleAlc 32-bit support
- The test enables five native energy-saving items and removes unnecessary sleep patches. 
- 删除cpu专属ssdt目录不在保留cpu变频SSDT请自行生成
- 添加常见问题说明文档
- 将v2系列默认主题更换Pink粉红色带有背景的示范主题
- 重新定义了USB支持Mac Pro6,1机型的USB驱动
- 对核心进行了分叉化处理
- 修复至0.6.9以来由于OpenCanopy重构导致图形画引导性能降低的bug。
- 修补主题中缺失的图标
- 添加10.9-10.11中使用网络恢复安装的支持驱动
- 将默认 APFS `MinDate`和`MinVersion`增加到 macOS Big Sur 以提高安全性，弱安装低版本需要将该值默认```0```变更为```-1```,现在已经设定为默认保持兼容性。
- 更换经过验证的```CpuTscSync.kext```该驱动在macOS12下可完美加载，至于能否正常升级到macOS12还有待各位验证反馈。
- 核心供应商值修正为  Apple_Yaming 完美杜绝苹果官方固件覆盖问题
- 优化图形化引导加载性能
- 对默认SSDT集中的CPU列表描述删除补丁开启，用于解决部分机型报错 ```erro acpi(_SB.SCKN.C100)```错误。
- 将默认```config.plist```上对于cpu变频相关的补丁变更为关闭状态。
- 将```HfsPlus.efi,ExFatDxe.efi```更新为```MP61_0116_B17原生固件```暂未在V1版本中测试兼容性
- 添加```ExFatDxe.efi```，用于支持BOOTCAMP
- 升级核心架构到最新```支持Linux了，配置文件与之前版本在于UEFI驱动路径位置改变```
- 添加单盘双系统存放win引导路径```\EFI\win\Microsoft\Boot\bootmgfw.efi```默认对其进行了注释
- ```HfsPlus.efi```驱动验证完成，现在不在区分v1 与v2版本了 可通用了现在
- 合并文件和补丁

### 0.7.2-b ###
- 因项目还未完全同步oc核心接下来的版本依然是0.7.2新建立了0.7.2b版来进行过度
- 现在我们不再需要CPUFriendDataProvider.kext了，如果遇到需要请自行定制该驱动，因为只是一个config电源配置，并无实际需求。
- 经过验证将可能不在需要的低频数据驱动CPUFriend.kext移除到旧kext目录中，现在我们能直接享受原生电源管理了
- 新增v1变频补丁到配置中默认启用
- 更新了usb驱动，修正了后置2个前置（机箱）两个只有不能同时运行在3.0协议速率的bug
- 将SSDT-NVMe.aml，SSDT-SBUS-MCHC.aml重默认启用中移除
- 合并了SSDT-USB-Reset-X与SSDT-EC，重命名为SSDT-USBX-EC.aml。
- 移除了默认固定声卡设备，改为启动引导处注入id方便不同id的注入测试。
- 跟具反馈将默认的AppleALC声卡单节点alc662+892替换为全节点驱动
- 对一位小伙伴在老机型上只能使用四叶草引导的问题对存档的四叶草进行了更新升级到最新5138版本，测试可以完美无损引导macOS11.x
- 更新网卡驱动为RealtekRTL8111.kext 2.2.6自编译版本，经测试该版本更加稳定兼容性更好。
- 更新内置机型固件版本
- 核心升级到0724
- 更换CpuTsync同步驱动测试支持与稳定性
- 统一内置驱动最低支持OS版本10.9+
- 添加完整的主板DSDT用与参考针对自行修改错误部分的修复，该DSDT.dsl支持最新的iasl编译无错 完全符合规范，未删减原版固件的任何东西
- 调整了内置驱动支持的最小内核版本
- 添加了UNC.dsl在双路中的参考写法，如果自行修复了主板中内置的DSDT.aml那么不需要
- 更新内置UNC.aml适配更多路径为 ```_SB.PCI0.UNC0```路径的设备

### 0.7.2-a ###
- 添加SSDT-NVMe.aml用以解决磁盘显示外置问题
- 更新HfsPlusLegacy.efi与HfsPlus.efi驱动版本，支持最新cpu
- 更新 Open Core 核心版本到version:0.7.2
- 改进图形引导资源路径现在可以按照文件夹来制作自己的专属图形了！/EFI/OC/Resources/Image/Acidanthera!
- 改进配置文件，添加新的热纠错选项
- 修复部分错误，已支持11.5beta测试完成并没什么损坏问题出现！
- 调整EFI路径分为v1与v2
- 新增几个旧版OS官方商店获取地址
- 升级驱动版本适配11.5beta2-，暂时未对开发者预览发布版的12做支持性测试
- 清理v2版本中不在需要的图片资源
- 升级核心版本到 REL-072-2021-06-10
- 更新图形资源适配
- 参考的config文件更新
- 优化GUI引导能效
- x79由于主板bios是双xpu核心暂时无法直接升级Mac OS 12.0_beta等待适配
- 11.5_beta版本验证测试完成无损升级
- 升级核心版本到 REL-072-2021-06-12 开启macOS 12的支持适配作业
- 添加cpu预设值 至强e5 16xx-26xx 值固定为2561 16进制显示为<0A01>
- 将VoodooTSCSync保留到旧kext目录中 因为在macOS 12中已经不在受支持 改为支持M macOS 12 的 CpuTscSync.kext
- 验证macOS11.5 beta3 的支持 
- 升级驱动RealtekRTL8111.kext至2.4.2版本 如遇到没网情况请回退至2.2.2版本以下！该驱动可以在旧kext目录中找到！
- 经过验证测试RealtekRTL8111.kext目前稳定支持的为2.2.2现进行固定
- 合并USBX与USB-Reset两个ssdt为USB-Reset-X.aml
- 更新了SSDT-EC.aml 解决双系统情况下oc引导到win时间错误的bug
- 所有驱动均按照项目仓库最新提交来进行日更新，用于推进macOS12的适配 
- 10.13.6适配完成，用专版目录来放置存档
- 10.13.6专版默认用的v2版本cpu适配如果是v1版本u使用请去除OpenCanopy.efi，将HfsPlus.efi替换为HfsPlusLegacy.efi即可，如果机器有Nvme磁盘还需要加入NvmExpressDxe.efi。
- 修复SSDT-EC中的错误，该错误导致的问题是双系统下windows11中时间停滞。
- 进行了全系列os X 10.9-11.5.beta4之间的安装验证，现在已经整合完毕，不再需要独立对10.13.6进行区分了，目前如果安装旧版本，请回退网卡驱动的版本。
- 添加打包脚本，生成sha256sum校验发布文件
- update config.plist与.efi驱动
- 添加内核cpu补丁到v1版本中

### 0.7.1 ###
- 更新版本号
- 添加HPET示范补丁和示范SSDT
- 预备适配10.13.X系统兼容安装
- 对最新版本11.3.1进行了测试兼容性良好，无任何驱动损坏问题出现
- 核心升级到 OpenCore REL-069-2021-05-05稳定版本检测当前运行版本核心指令"nvram 4D1FDA02-38C7-4A6A-9CC6-4BCCA8B30102:opencore-version"
- 更新AppleALC到1.6.0-RELEASE
- 更新Lilu到1.5.3-RELEASE
- 更新VirtualSMC到1.2.3-RELEASE
- 更新WhateverGreen到1.4.9-RELEASE
- 替换VoodooTSCSync为CpuTscSync-1.0.3-RELEASE
- 修复多个可能在非纯uefi环境下安装造成内核恐慌的bug具体表现为 MACHreboot附近
- 新增部分驱动旧版保留目录以解决部分硬件对驱动不兼容的bug，目录名称为“旧kext”
- 新增完整dmg下载脚本命令到readme.md文档
- 核心升级到 OpenCore REL-070-2021-05-06以适配macOS Big Sur 11.4 Beta 1
- 添加了了32纳米v1版本cpu的图形化引导界面支持
- 将核心版本同步到REL-071-2021-05-14 之后版本中不会在出现发布版本号与核心版本号不同步的情况了
- 核心升级071主要改进性能，升级内置SmBIOS机型固件版本，提升稳定性
- 目前已支持10.13.x系统但是无法在华南的x79上面安装，测试主板华硕，英特尔双路x79安装并未出现在华南主板上面所存在的异常，华南x79主板依然需要等待

### 0.7.0 ###
- 添加了ssdt说明
- 校验了n卡在最新版本中的支持情况
- 对cpu变频进行了完整的校验
- 显卡硬解问题说明，安装时请勿变更机型到iMacPro1,1,安装完成后变更机型即可开启硬解
- 新增了cpu变频数值错误修复补丁
- 添加融合硬盘设置说明
- 定义从0.7.0版本中添加上默认cpu变频ssdt修补异常 变频ssdt名称定义为SSDT-CPUM.aml
- 对于v2版本u将开启默认图形化引导
- 调整日志排序和路径
- 对即将发布的Mac OS big sur 11.3bate版本进行了驱动以及核心兼容性测试
- 规范0.7.0中将要启用的ssdt表
- 添加（SBUS系统总线支持ssdt示范）安装为目的的时候我们不需要，该ssdt为系统润色用途，可用可不用
- 替换VoodooTSCSync.kext为CpuTscSync.kext提升启动效率
- 启动参数必须存在ncpi=0x2000 不然会卡住cpu频率同步
- 核心升级到REL-068-2021-03-25 0.6.8
- 添加当前运行的OC核心版本查询指令“nvram 4D1FDA02-38C7-4A6A-9CC6-4BCCA8B30102:opencore-version ”
- 修复了温度传感器与系统总线管理
- 更正仓库内默认的cpu变频ssdt v1_32纳米（2670_v1_c2） v2_22纳米（2670_v2） 
- 更新AppleALC至1.5.8，Lilu至1.5.1 ，WhateverGreen至1.4.8 其余驱动还在进行兼容性测试
- 添加subs系统总系支持是否正常工作指令到说明文档 kextstat | grep -E "AppleSMBusController|AppleSMBusPCI"
- 添加16进制转换指令到readme说明文档中
- 请勿将网卡驱动升级到2.4.0断流严重
- 添加免驱Wi-Fi原拆网卡支持系统说明列表
- 进入SSDT精简安排以支持更多不同板型号的x79
- 0.7.0_beta2版本发布更新核心进一步升级到 REL-068-2021-04-02 版本已知图形引导失效
- 更新后支持10.14-11.2.3任意版本正向升级和降级
- 精简了大量的ssdt与固定参数，变为可变参数，不在为固定参数
- 添加usb供电修复，更加适配Mac OS
- 由于大量的RealtekRTL8111/8168网卡不兼容2.4.0版本驱动现回退到2.2.2版本
- 进行了大量兼容测试最终发布版本核心REL-069-2021-04-17
- 注意请勿使用occ编辑器和其它编辑器修改配置文件！

### 0.6.9 ###
- 添加cpu变频修复详细教程
- 添加V2版本CPU支持
- 添加解锁CPU变频补丁解锁MSR
- 默认C2 V1 32纳米版本U缺少指令集说明
- 默认V2 22 纳米U指令集支持说明
- N卡开普勒核心GTX760 770 安装必须使用HDMI线连接显示器，不然跑完代码重启无法进入系统说明
- A卡RX 470 570 580 8G(2304sp)版本支持说明
- 核心升级官方稳定版0.6.7
- CpuPmCfg锁开启以解锁CPU变频-因为官方默认BIOS没有关闭该选项
- 驱动更新
- 发布版本中包含 V1版本CPU 32纳米与22纳米 V2版本CPU

### 0.6.8 ###
- 尝试修复2689CPU变频问题
- 更新驱动到最新版本
- 核心升级到OpenCore官方稳定版0.6.6
- 添加一盘双系统引导实例
- 用绝对路径来引导win预防被win10覆盖掉引导项的尴尬
- 测试升级到macOS big sur 11.2.1无任何错误

### 0.6.7 ###
- 重点更新适配原厂BIOS
- 无需任何BIOS更改 使用uefi U盘启动即可安装
- 修复一盘双系统情况下win无法正常关机（原厂BIOS下正常，刷BIOS版本暂未修复）
- 默认机型依旧定义为MacPro6,1(苹果垃圾桶)
- 已知在iMacPro1,1机型下会出现安装的时候驱动注入不正常导致声卡无法启用 alc声卡ID 662选择注入5 892的注入7更多请自行测试

### 0.6.6_beta_03 ###
- 应网友要求适配下原版BIOS的引导以及安装
- 添加正式需求进入处理期
- 由于只有蓝色大版rev2.0.1版本暂定只适配该版本原版

### 0.6.6_beta_02 ###
- 修复添加图形引导界面黑屏问题（现在可以添加图形引导了）
- 替换HfsPlusLegacy.efi驱动为OpenHfsPlus.efi，适配下一正式版兼容
- 修正一个导致内存溢出启动花屏的bug
- 去除错误的动导致使用虚拟机卡死问题
- 修正sata原生驱动6g速率协商只有3g速率问题 

### 0.6.6 ###
- 已知问题Mac big sur 11.2beta版本中cpu变频出现故障没有变频效果，暂时请勿升级最新bate版（预计修复时间在正式版发布后一周）
- 配置文件中添加facetim通话，短信，固定网卡实列在配置文件上 只需修改为自己对应en0网卡pcie地址即可完美修复
- 修复一个异常导致使用中电源崩溃的严重问题建议所有使用该efi用户都升级到当前版本
- 升级后请将配置文件中三码重新生成，ROM码修改为自己对应en0网卡Mac地址
- 替换HfsPlusLegacy.efi驱动为OpenHfsPlus.efi，适配下一正式版兼容

- 0.6.5开始每个发布版本均链接到下载地址
- 修复一个错误看不到重置navme菜单
- 添加抹盘说明，磁盘抹盘为全盘apfs 
- 添加三码编辑器克隆地址
- 添加配置文件编辑器地址
- 添加github地址
- 预计添加英文说明文档

