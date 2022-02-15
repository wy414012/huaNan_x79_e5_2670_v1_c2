## macrecovery

macrecovery is a tool that helps to automate recovery interaction. It can be used to download diagnostics and recovery as well as analyse MLB.

Requires python to run. Run with `-h` argument to see all available arguments.

To create a disk image for a virtual machine installation use `build-image.sh`.

现在根据您想要的 macOS 版本运行以下之一（请注意，这些脚本依赖于 Python（打开新窗口）支持，如果您尚未安装，请安装：
Mavericks(10.9):python macrecovery.py -b Mac-F60DEB81FF30ACF6 -m 00000000000FNN100 download
Yosemite(10.10):python macrecovery.py -b Mac-E43C1C25D4880AD6 -m 00000000000GDVW00 download
El Capitan(10.11):python macrecovery.py -b Mac-FFE5EF870D7BA81A -m 00000000000GQRX00 download
Sierra(10.12):python macrecovery.py -b Mac-77F17D7DA9285301 -m 00000000000J0DX00 download
Mojave(10.14):python macrecovery.py -b Mac-7BA5B2DFE22DDD8C -m 00000000000KXPG00 download
Catalina(10.15):python macrecovery.py -b Mac-00BE6ED71E35EB86 -m 00000000000000000 download
Big Sur(11.6):python macrecovery.py -b Mac-42FD25EABCABB274 -m 00000000000000000 download
Monterey(12):python macrecovery.py -b Mac-F60DEB81FF30ACF6 -m 00000000000000000 -os latest download