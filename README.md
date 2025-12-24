# 🧚 邓恩赐原生手机 APP

[![Build Android APK](https://github.com/YOUR_USERNAME/dengenci-native-app/actions/workflows/build-android.yml/badge.svg)](https://github.com/YOUR_USERNAME/dengenci-native-app/actions/workflows/build-android.yml)

## 📱 下载安装包

### 方法一：GitHub Actions（推荐）⭐

1. **上传代码到 GitHub**
   ```bash
   cd /Users/jing.c_ds/Documents/邓恩赐/dengenci-native-app

   # 初始化 Git 仓库
   git init
   git add .
   git commit -m "Initial commit"

   # 创建 GitHub 仓库后执行
   git remote add origin https://github.com/你的用户名/dengenci-native-app.git
   git push -u origin main
   ```

2. **自动构建**
   - 推送到 GitHub 后会自动开始构建
   - 或者在 GitHub 网页上手动触发：
     - 进入 Actions 标签
     - 选择 "Build Android APK"
     - 点击 "Run workflow"

3. **下载 APK**
   - 构建完成后（约 5-10 分钟）
   - 进入 Actions → 最新的一次构建
   - 在 "Artifacts" 部分下载 `dengenci-android-debug`
   - 解压后得到 `app-debug.apk`

### 方法二：使用 GitHub CLI

```bash
# 安装 GitHub CLI (如果没有)
brew install gh

# 登录
gh auth login

# 创建仓库并推送
gh repo create dengenci-native-app --public --source=. --remote=origin
git push -u origin main

# 等待构建完成后下载
gh run download --name dengenci-android-debug
```

## 📲 安装到手机

### Android (Vivo iQOO 12 Pro)

1. **通过微信安装**
   - 在微信中接收 `app-debug.apk` 文件
   - 点击文件
   - 允许安装来自未知来源的应用
   - 点击安装

2. **通过 USB 传输**
   - 将 APK 文件复制到手机
   - 在文件管理器中点击 APK
   - 允许安装并完成

3. **扫码下载**
   - 上传 APK 到网盘或云存储
   - 在手机上扫码下载

## 🔧 连接电脑

1. **确保电脑和手机在同一 Wi-Fi**

2. **启动电脑端 Menu Bar App**
   ```bash
   cd /Users/jing.c_ds/Documents/邓恩赐/dengenci-menubar-app
   npm start
   ```

3. **在手机 APP 中会自动连接到电脑**

## ⚙️ 配置说明

### 修改服务器地址

如果电脑 IP 地址不是 `192.168.110.254`，需要修改：

**编辑 `www/index.html`：**
```javascript
const WS_URL = 'ws://你的电脑IP:3001?type=mobile';
```

然后重新构建：
```bash
npx cap sync android
```

## 📋 应用权限

- `INTERNET` - 连接到电脑服务器
- `ACCESS_NETWORK_STATE` - 检查网络状态

## 🔐 签名说明

当前使用 Debug 签名，可以在所有 Android 设备上安装但会有警告提示。

如需正式发布，需要申请正式签名证书。

## 🆕 更新应用

修改代码后：
```bash
git add .
git commit -m "更新说明"
git push
```

GitHub Actions 会自动构建新的 APK。

## 📞 技术支持

如有问题，请检查：
1. 手机和电脑在同一 Wi-Fi
2. 电脑端 Menu Bar App 正在运行
3. 手机应用有显示 "✅ 已连接"
