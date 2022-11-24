#!/bin/bash
# 修改openwrt登陆地址 
sed -i 's/192.168.1.1/192.168.31.88/g' package/base-files/files/bin/config_generate
# 修改默认banner
wget -O ./package/base-files/files/etc/banner https://raw.githubusercontent.com/nkym233/img/main/banner

# 替换默认argon主题
rm -rf package/feeds/luci/luci-theme-argon && git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/feeds/luci/luci-theme-argon
sed -i 's#luci-theme-bootstrap#luci-theme-argon#g' feeds/luci/collections/luci/Makefile
sed -i 's/bootstrap/argon/g' feeds/luci/modules/luci-base/root/etc/config/luci

# 修改argon主题默认壁纸Change default BackGround img
wget -O ./package/lean/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg https://raw.githubusercontent.com/nkym233/img/main/r2g7rm.jpg

# 修改默认docker挂载路径
sed -i "s/opt/mnt\/sda4/g" ./feeds/packages/utils/dockerd/files/daemon.json
