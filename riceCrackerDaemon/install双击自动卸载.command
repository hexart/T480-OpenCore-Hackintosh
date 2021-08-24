#!/bin/bash

path=${0%/*}
sudo launchctl remove /Library/LaunchAgents/org.zysuper.riceCracker.plist
sudo pkill riceCrackerDaemon
sudo rm -f /Library/LaunchAgents/org.zysuper.ricecracker.daemon.plist
sudo rm -f "/Library/Application Support/riceCrackerDaemon/riceCrackerDaemon"

echo '卸载米果守护进程完成！'
echo '卸载程序结束! '
bash read -p '按任何键退出'