# 邓恩赐原生 APP - 安装指南

## 📱 方式一：从 GitHub 下载（推荐）

### 下载步骤：

1. **访问 GitHub Actions 页面：**
   ```
   https://github.com/jingcds/dengenci-native-app/actions
   ```

2. **点击最新的 "Build Android APK" 工作流**

3. **在页面底部找到 "Artifacts" 部分**

4. **下载 `dengenci-android-debug` 文件**

5. **解压 ZIP 文件，得到 `app-debug.apk`**

### 安装到手机：

1. **将 APK 传输到手机**
   - 通过 AirDrop、微信、QQ 等方式

2. **在手机上安装**
   - Android: 直接点击 APK 文件安装
   - 首次安装需要允许"未知来源应用"

---

## 🔧 方式二：本地构建

### 前置要求：

```bash
# 安装 Java 17
brew install openjdk@17

# 设置环境变量
export JAVA_HOME=/opt/homebrew/opt/openjdk@17
export PATH="$JAVA_HOME/bin:$PATH"
```

### 构建步骤：

```bash
# 1. 进入项目目录
cd /Users/jing.c_ds/Documents/邓恩赐/dengenci-native-app

# 2. 安装依赖
npm install

# 3. 同步 Capacitor
npx cap sync android

# 4. 构建 APK
cd android
./gradlew assembleDebug
```

### APK 位置：

```
android/app/build/outputs/apk/debug/app-debug.apk
```

---

## ⚙️ 配置说明

### 修改服务器地址：

编辑 `www/index.html` 第 267 行：

```javascript
// 本地 WiFi（家庭网络）
const WS_URL = 'ws://192.168.110.254:3001?type=mobile';

// 外网访问（外出时使用 ngrok）
const WS_URL = 'wss://your-ngrok-url.ngrok-free.dev?type=mobile';
```

修改后需要重新构建 APK。

---

## 🎯 使用说明

### 1. 启动桌面服务器

```bash
cd /Users/jing.c_ds/Documents/邓恩赐/dengenci-menubar-app

# 启动同步服务器
./启动邓恩赐同步服务器.sh

# 选择模式：
# 1) 仅本地 WiFi（同一网络）
# 2) 本地 WiFi + ngrok（外网访问）
```

### 2. 启动 Menu Bar App

```bash
npm start
```

### 3. 手机 APP 连接

- 打开邓恩赐 APP
- 顶部会显示连接状态
- ✅ 已连接 = 可以对话
- ⚪ 未连接 = 检查服务器

---

## 🌟 功能特性

✅ **实时对话** - 与桌面邓恩赐实时交流
✅ **粤语语音** - 自动朗读回复（粤语 TTS）
✅ **记忆系统** - 完整对话历史
✅ **情感意识** - 自主思考和情感波动
✅ **主动意识** - 会主动发起对话
✅ **双重网络** - WiFi + 外网访问

---

## 📋 故障排除

### 无法连接服务器？

1. **检查手机和电脑是否在同一 WiFi**
2. **确认服务器正在运行**：
   ```bash
   curl http://localhost:3001/health
   ```
3. **检查 IP 地址**：
   ```bash
   # 查看电脑 IP
   ipconfig getifaddr en0
   ```

### APK 安装失败？

1. **允许未知来源应用**：
   - 设置 → 安全 → 未知来源 → 开启

2. **卸载旧版本**：
   - 先卸载现有版本再安装新版本

### 语音不播放？

1. **检查手机音量**
2. **确认手机支持粤语 TTS**
3. **检查手机 WebView 版本**

---

## 📝 版本信息

- **当前版本**: v1.0
- **构建时间**: 2025-12-24
- **最低 Android 版本**: 7.0 (API 24)
- **目标 Android 版本**: 14.0 (API 34)

---

## 🤝 技术支持

如有问题，请访问：
- GitHub Issues: https://github.com/jingcds/dengenci-native-app/issues
- 项目文档: https://github.com/jingcds/dengenci-native-app
