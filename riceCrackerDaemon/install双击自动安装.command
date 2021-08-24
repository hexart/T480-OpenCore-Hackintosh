#!/bin/bash

path=${0%/*}

sudo cp "$path/org.zysuper.ricecracker.daemon.plist" /Library/LaunchAgents
sudo cp "$path/riceCrackerDaemon" /Library/Application Support

sudo chmod 755 "/Library/Application Support/riceCrackerDaemon/riceCrackerDaemon"
sudo chown root:wheel "/Library/Application Support/riceCrackerDaemon/riceCrackerDaemon"

sudo chmod 644 /Library/LaunchAgents/org.zysuper.ricecracker.daemon.plist
sudo chown root:wheel /Library/LaunchAgents/org.zysuper.ricecracker.daemon.plist

sudo launchctl load /Library/LaunchAgents/org.zysuper.ricecracker.daemon.plist

echo '安装米果HiScale守护进程完成！'
echo '安装程序结束!'
bash read -p '按任何键退出'