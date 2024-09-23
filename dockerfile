# 使用官方的 Node.js 20 版本基础镜像
FROM node:20-alpine

# 设置工作目录
WORKDIR /app

# 复制 package.json 和 pnpm-lock.yaml
COPY package.json pnpm-lock.yaml ./

# 安装 pnpm
RUN npm install -g pnpm

# 安装项目依赖
RUN pnpm install

# 复制项目文件
COPY . .

# 构建项目
RUN pnpm build

# 暴露端口，假设应用运行在4000端口
EXPOSE 4000

# 启动应用（确保 package.json 中有对应的 start 脚本）
CMD ["pnpm", "start"]