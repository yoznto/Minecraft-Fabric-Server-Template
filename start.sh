#!/bin/bash
set -e

MODS_ID="1BdOxcbIdesZBywmxoxYdRX8si2wiexmE"
MODS_URL="https://drive.google.com/uc?export=download&id=${MODS_ID}"

# 下載 mods.zip（如未存在）
if [ ! -d "mods" ]; then
    echo "📥 正在下載模組（使用 curl）..."
    curl -L -o mods.zip "$MODS_URL"
    unzip mods.zip -d mods
    rm mods.zip
else
    echo "✅ mods 資料夾已存在"
fi

# 自動下載並安裝 Fabric server
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
java -Xmx2G -Xms2G -jar fabric-server-launch.jar nogui
