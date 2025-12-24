#!/bin/bash
# 邓恩赐原生 APP - 一键构建脚本

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🧚 邓恩赐原生 APP - APK 构建脚本"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# 设置环境变量
export JAVA_HOME=/opt/homebrew/opt/openjdk@17
export PATH="$JAVA_HOME/bin:$PATH"

# 检查 Java
if ! command -v java &> /dev/null; then
    echo "❌ Java 未安装，正在安装..."
    brew install openjdk@17
    export JAVA_HOME=/opt/homebrew/opt/openjdk@17
    export PATH="$JAVA_HOME/bin:$PATH"
fi

echo "✅ Java 版本:"
java -version
echo ""

# 进入项目目录
cd "$(dirname "$0")"

# 安装依赖
echo "📦 安装依赖..."
npm install

# 同步 Capacitor
echo "🔄 同步 Capacitor..."
npx cap sync android

# 构建 APK
echo "🔨 构建 APK..."
cd android
./gradlew assembleDebug --no-daemon

# 检查构建结果
APK_PATH="app/build/outputs/apk/debug/app-debug.apk"
if [ -f "$APK_PATH" ]; then
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "✅ APK 构建成功！"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "📱 APK 位置: $APK_PATH"
    echo ""

    # 显示文件大小
    APK_SIZE=$(du -h "$APK_PATH" | cut -f1)
    echo "📦 文件大小: $APK_SIZE"
    echo ""

    # 打开文件夹
    echo "📂 打开文件夹..."
    open "app/build/outputs/apk/debug/"

    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "💡 安装说明："
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "1. 将 app-debug.apk 传输到手机"
    echo "   - 通过 AirDrop、微信、QQ 等"
    echo ""
    echo "2. 在手机上点击 APK 安装"
    echo "   - 首次安装需要允许'未知来源应用'"
    echo ""
    echo "3. 启动邓恩赐 APP"
    echo "   - 确保电脑端服务器已启动"
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
else
    echo ""
    echo "❌ APK 构建失败！"
    echo "请检查错误信息。"
    exit 1
fi
