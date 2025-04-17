# 使用輕量 Alpine Java 17
FROM eclipse-temurin:17-jdk-alpine

# 安裝 unzip、curl、bash
RUN apk add --no-cache unzip curl bash

# 設定工作資料夾
WORKDIR /app

# 複製腳本與 eula
COPY start.sh ./
COPY eula.txt ./

# 設定執行權限
RUN chmod +x start.sh

EXPOSE 25565

# 啟動 Minecraft Server
CMD ["./start.sh"]
