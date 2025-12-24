#!/bin/bash
# 邓恩赐原生 APP - 推送到 GitHub

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📤 推送邓恩赐原生 APP 到 GitHub"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

if [ -z "$1" ]; then
  echo "使用方法:"
  echo "  ./push-to-github.sh https://github.com/你的用户名/dengenci-native-app.git"
  echo ""
  echo "步骤:"
  echo "  1. 在 GitHub 创建仓库: https://github.com/new"
  echo "  2. 仓库名: dengenci-native-app"
  echo "  3. 复制仓库地址"
  echo "  4. 运行此脚本: ./push-to-github.sh [仓库地址]"
  echo ""
  exit 0
fi

REPO_URL="$1"

echo "仓库地址: $REPO_URL"
echo ""
echo "正在推送..."

cd "$(dirname "$0")"

# 添加远程仓库
git remote add origin "$REPO_URL" 2>/dev/null || git remote set-url origin "$REPO_URL"

# 设置主分支
git branch -M main

# 推送代码
echo "正在推送到 GitHub..."
git push -u origin main

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ 推送完成！"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "下一步:"
echo "  1. 查看 GitHub Actions 构建状态"
echo "  2. 等待 5-10 分钟构建完成"
echo "  3. 下载 APK 安装包"
echo "  4. 安装到手机"
echo ""
