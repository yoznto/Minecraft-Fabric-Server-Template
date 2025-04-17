#!/bin/bash

MODS_ID="1BdOxcbIdesZBywmxoxYdRX8si2wiexmE"

# 下載並解壓 mods.zip（如未存在）
if [ ! -d "mods" ]; then
    echo "📥 Downloading mods..."
    curl -L -o mods.zip "https://drive.google.com/uc?export=download&id=$MODS_ID"
    unzip mods.zip -d mods
    rm mods.zip
else
    echo "✅ Mods already exist."
fi

# 自動下載 Fabric server jar（如未存在）
if [ ! -f "fabric-server-launch.jar" ]; then
    echo "🌐 Downloading Fabric Server..."
    curl -o fabric-installer.jar https://maven.fabricmc.net/net/fabricmc/fabric-installer/1.0.0/fabric-installer-1.0.0.jar
    java -jar fabric-installer.jar server -mcversion 1.20.1 -downloadMinecraft
    mv server.jar fabric-server-launch.jar
    rm fabric-installer.jar
fi

# 啟動伺服器
echo "🚀 Starting server..."
java -Xmx2G -Xms2G -jar fabric-server-launch.jar nogui
