#!/bin/bash

set -e

# 你的 GitHub mods.zip 檔案下載連結（請修改為自己的網址）
MODS_URL="https://github.com/yoznto/Minecraft-Fabric-Server-Template/releases/download/V1.0.0/mods.zip"

# 下載並解壓 mods.zip（如未存在）
if [ ! -d "mods" ]; then
    echo "📥 正在從 GitHub 下載模組..."
    curl -L "$MODS_URL" -o mods.zip
    unzip mods.zip -d mods
    rm mods.zip
else
    echo "✅ mods 資料夾已存在"
fi

# 自動下載並安裝 Fabric server（如果未存在）
if [ ! -f "fabric-server-launch.jar" ]; then
    echo "🌐 下載 Fabric 安裝器..."
    curl -o fabric-installer.jar https://maven.fabricmc.net/net/fabricmc/fabric-installer/1.0.0/fabric-installer-1.0.0.jar
    java -jar fabric-installer.jar server -mcversion 1.20.1 -downloadMinecraft
    mv server.jar fabric-server-launch.jar
    rm fabric-installer.jar
fi

# 同意 EULA
echo "eula=true" > eula.txt

# 啟動伺服器
echo "🚀 啟動伺服器..."
java -Xmx512M -Xms512M -jar fabric-server-launch.jar nogui


