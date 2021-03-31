### windows下制作安装u盘 ###
#### 首先，您需要以下内容：
- 4GB U盘
- [macrecovery](/OpenCore/docs/macrecovery)这里必须安装[python](https://www.python.org/downloads/)
#### 下载macOS
- 这里开始我们要进入下载的目录内
- ![image](/OpenCore/docs/macos_usb.png)
- ```cd /d clover-x79-e5-2670-rx588/OpenCore/docs/macrecovery```现在根据您想要的 macOS 版本运行以下之一（请注意，这些脚本依赖于 Python（打开新窗口）支持，如果您尚未安装，请安装）：
- # Lion(10.7):
python macrecovery.py -b Mac-2E6FAB96566FE58C -m 00000000000F25Y00 download
python macrecovery.py -b Mac-C3EC7CD22292981F -m 00000000000F0HM00 download

# Mountain Lion(10.8):
python macrecovery.py -b Mac-7DF2A3B5E5D671ED -m 00000000000F65100 download

# Mavericks(10.9):
python macrecovery.py -b Mac-F60DEB81FF30ACF6 -m 00000000000FNN100 download

# Yosemite(10.10):
python macrecovery.py -b Mac-E43C1C25D4880AD6 -m 00000000000GDVW00 download

# El Capitan(10.11):
python macrecovery.py -b Mac-FFE5EF870D7BA81A -m 00000000000GQRX00 download

# Sierra(10.12):
python macrecovery.py -b Mac-77F17D7DA9285301 -m 00000000000J0DX00 download

# High Sierra(10.13)
python macrecovery.py -b Mac-7BA5B2D9E42DDD94 -m 00000000000J80300 download
python macrecovery.py -b Mac-BE088AF8C5EB4FA2 -m 00000000000J80300 download

# Mojave(10.14)
python macrecovery.py -b Mac-7BA5B2DFE22DDD8C -m 00000000000KXPG00 download

# Catalina(10.15)
python macrecovery.py -b Mac-00BE6ED71E35EB86 -m 00000000000000000 download

# Latest version
# ie. Big Sur(11)
python macrecovery.py -b Mac-E43C1C25D4880AD6 -m 00000000000000000 download

macOS 11，大苏尔注：由于这个操作系统相当新，某些系统仍然存在一些问题需要解决
![image](/OpenCore/docs/macrecovery-done.1b0960bc.png)
- 现在需要一些时间来等待下载完成
- 我们开始格式化u盘 执行```Windows + R ``` ```运行diskpart```
- ```list disk```
- ```select disk 1```
- ```clean```
- ```convert gpt```
- ```create partition primary```
- ```select partition 1```
- ```format fs=fat32 quick```
- ```ASSIGN LETTER=E```
- 接下来，转到此USB驱动器的根目录，创建一个名为com.apple.recovery.boot的文件夹。然后移动下载的BaseSystem或RecoveryImage文件。请确保您通过.dmg和.chunklist文件复制到此文件夹：
![image](/OpenCore/docs/com-recovery.805dc41f.png)
- 完成后我们看到的应该是这样
![image](/OpenCore/docs/com-efi-done.a6fb730e.png)
- 这样就完整的创建好了
