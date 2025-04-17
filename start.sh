#!/bin/bash

# Google Drive 檔案 ID（你的 mods.zip）
MODS_ID="1BdOxcbIdesZBywmxoxYdRX8si2wiexmE"

# 如果 mods 資料夾不存在，就從 Google Drive 下載並解壓
if [ ! -d "mods" ]; then
    echo "📥 Downloading mods from Google Drive..."
    echo "🔗 https://drive.google.com/file/d/$MODS_ID/view?usp=sharing"
    gdown --id "$MODS_ID" -O mods.zip

    echo "📂 Extracting mods..."
    unzip mods.zip -d mods
    rm mods.zip
else
    echo "✅ Mods folder already exists."
fi

# 啟動伺服器
echo "🚀 Starting Minecraft server..."
java -Xmx2G -Xms2G -jar fabric-server-launch.jar nogui
