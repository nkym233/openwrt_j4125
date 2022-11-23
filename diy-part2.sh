#!/bin/bash
# 修改openwrt登陆地址 
sed -i 's/192.168.1.1/192.168.31.88/g' package/base-files/files/bin/config_generate
# 修改默认banner
wget -O ./package/base-files/files/etc/banner https://raw.githubusercontent.com/nkym233/img/main/banner

# 更换默认主题为argone
git clone -b 21.02 https://github.com/kenzok78/luci-theme-argonne ./package/lean/luci-theme-argonne

sed -i 's#luci-theme-bootstrap#luci-theme-argone#g' feeds/luci/collections/luci/Makefile
sed -i 's/bootstrap/argone/g' feeds/luci/modules/luci-base/root/etc/config/luci

# 修改argone主题默认壁纸Change default BackGround img
wget -O ./package/lean/luci-theme-argonne/htdocs/luci-static/argonne/img/bg1.jpg https://raw.githubusercontent.com/nkym233/img/main/r2g7rm.jpg

# 修改默认docker挂载路径
sed -i "s/opt/mnt\/sda4/g" ./feeds/packages/utils/dockerd/files/daemon.json
