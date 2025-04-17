# 使用適合 Minecraft 的 Java 17 環境
FROM openjdk:17

# 安裝 unzip 與 pip，pip 用來裝 gdown（從 Google Drive 下載檔案）
RUN apt update && \
    apt install -y unzip python3-pip && \
    pip install gdown

# 設定工作目錄
WORKDIR /app

# 複製啟動腳本與 Fabric server 主程式（請確保在 repo 中有 fabric-server-launch.jar）
COPY start.sh ./
COPY fabricmc_server/fabric-server-launch.jar ./
COPY eula.txt ./

# 啟用權限
RUN chmod +x start.sh

# 對外開放 Minecraft 伺服器的預設埠
EXPOSE 25565

# 啟動伺服器
CMD ["./start.sh"]
