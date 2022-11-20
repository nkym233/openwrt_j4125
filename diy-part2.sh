#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
#diy2.sh
#删除lean大集成的旧版argon主题，更换为新版argon主题#Change Argon Theme
rm -rf ./feeds/luci/themes/luci-theme-argon && git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git ./feeds/luci/themes/luci-theme-argon
#更换默认主题为argon，并删除bootstrap主题
sed -i 's#luci-theme-bootstrap#luci-theme-argon#g' feeds/luci/collections/luci/Makefile
sed -i 's/bootstrap/argon/g' feeds/luci/modules/luci-base/root/etc/config/luci

# 修改argon主题默认壁纸Change default BackGround img
wget -O ./feeds/luci/themes/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg https://raw.githubusercontent.com/nkym233/img/main/r2g7rm.jpg
# 修改默认后台ip default IP
sed -i 's/192.168.1.1/192.168.31.88/g' package/base-files/files/bin/config_generate
