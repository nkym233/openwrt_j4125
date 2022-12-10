#!/bin/bash
# 修改openwrt登陆地址 
sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/files/bin/config_generate
# 修改默认banner
wget -O ./package/base-files/files/etc/banner https://raw.githubusercontent.com/nkym233/img/main/banner

# 替换默认argon主题
rm -rf ./feeds/luci/themes/luci-theme-argon && git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git ./feeds/luci/themes/luci-theme-argon
sed -i 's#luci-theme-bootstrap#luci-theme-argon#g' feeds/luci/collections/luci/Makefile
sed -i 's/bootstrap/argon/g' feeds/luci/collections/luci-ssl-nginx/Makefile
sed -i 's/bootstrap/argon/g' feeds/luci/modules/luci-base/root/etc/config/luci

# 修改argon主题默认壁纸Change default BackGround img
wget -O ./feeds/luci/themes/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg https://raw.githubusercontent.com/nkym233/img/main/r2g7rm.jpg

# 修改默认docker挂载路径
#sed -i "s/opt/mnt\/sda4/g" ./feeds/packages/utils/dockerd/files/daemon.json

# 修改版本号
sed -i "s/OpenWrt /nkym build $(TZ=UTC-8 date "+%Y%m%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings
