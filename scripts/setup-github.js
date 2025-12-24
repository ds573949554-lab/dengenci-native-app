#!/usr/bin/env node

const { execSync } = require('child_process');
const fs = require('fs');
const path = require('path');

console.log('🚀 邓恩赐原生 APP - GitHub 自动构建设置\n');

// 检查 git 是否安装
try {
  execSync('git --version', { stdio: 'pipe' });
  console.log('✅ Git 已安装\n');
} catch {
  console.log('❌ 需要先安装 Git:');
  console.log('   brew install git\n');
  process.exit(1);
}

// 检查是否已初始化 git
if (fs.existsSync(path.join(process.cwd(), '.git'))) {
  console.log('⚠️ Git 仓库已存在');
  console.log('如果需要重新设置，请先删除 .git 文件夹\n');
} else {
  console.log('📦 初始化 Git 仓库...');
  try {
    execSync('git init', { stdio: 'pipe' });
    execSync('git add .', { stdio: 'pipe' });
    execSync('git commit -m "Initial commit: 邓恩赐原生 APP v1.0"', { stdio: 'pipe' });
    console.log('✅ Git 仓库初始化完成\n');
  } catch (error) {
    console.log('❌ Git 初始化失败:', error.message);
  }
}

console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
console.log('📋 下一步操作指南');
console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n');

console.log('1️⃣  创建 GitHub 仓库:');
console.log('   • 打开 https://github.com/new');
console.log('   • 仓库名: dengenci-native-app');
console.log('   • 设置为 Public');
console.log('   • 不要初始化 README、.gitignore');
console.log('   • 点击 "Create repository"\n');

console.log('2️⃣  推送代码到 GitHub:');
console.log('   git remote add origin https://github.com/你的用户名/dengenci-native-app.git');
console.log('   git branch -M main');
console.log('   git push -u origin main\n');

console.log('3️⃣  启动自动构建:');
console.log('   • 推送后会自动开始构建');
console.log('   • 或进入 GitHub → Actions → Build Android APK → Run workflow\n');

console.log('4️⃣  下载 APK:');
console.log('   • 构建完成后(约5-10分钟)');
console.log('   • 进入 Actions → 点击最新构建');
console.log('   • 在 Artifacts 处下载 dengenci-android-debug');
console.log('   • 解压得到 app-debug.apk\n');

console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n');

console.log('📱 安装到手机后:');
console.log('   1. 确保手机和电脑在同一 Wi-Fi');
console.log('   2. 启动电脑端 Menu Bar App');
console.log('   3. 打开手机 APP，会自动连接\n');

console.log('💡 提示: 如果没有 GitHub 账号，需要先注册');
console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n');

// 检查是否有 GitHub CLI
try {
  execSync('gh --version', { stdio: 'pipe' });
  console.log('✅ 检测到 GitHub CLI');
  console.log('\n可以使用快速命令:\n');
  console.log('   gh auth login           # 登录 GitHub');
  console.log('   gh repo create dengenci-native-app --public --source=. --remote=origin');
  console.log('   git push -u origin main\n');
} catch {
  // GitHub CLI 未安装
}

console.log('完成设置后，输入以下命令查看构建状态:');
console.log('   gh run list               # 查看构建历史');
console.log('   gh run download          # 下载最新 APK\n');
