# 游戏中心 iOS App

包含三个游戏：2048、数独、24点挑战

## 系统要求

- macOS 10.15 或更高版本
- Xcode 14.0 或更高版本
- Node.js 16 或更高版本
- Apple Developer 账号（用于签名和真机安装）

## 快速开始

### 1. 安装依赖

```bash
cd ios-app
npm install
```

### 2. 初始化 iOS 项目

```bash
npx cap add ios
```

### 3. 同步 Web 代码到 iOS

```bash
npx cap sync
```

### 4. 在 Xcode 中打开项目

```bash
npx cap open ios
```

### 5. 构建 IPA 文件

在 Xcode 中：
1. 选择目标设备为 "Any iOS Device"
2. 菜单栏选择 Product → Archive
3. 在 Organizer 中点击 "Distribute App"
4. 选择 "Ad Hoc" 或 "App Store Connect"
5. 导出 IPA 文件

## 目录结构

```
ios-app/
├── src/                    # Web 源代码
│   └── index.html         # 主入口文件（iPad优化版）
├── ios/                   # iOS 原生项目（运行 cap add ios 后生成）
│   └── App/
├── capacitor.config.json  # Capacitor 配置
└── package.json
```

## 开发调试

使用 Safari 开发者工具调试：
1. 在 iOS 模拟器或真机运行 App
2. Safari → 开发 → 选择设备 → gamecenter

## 配置说明

### 修改 Bundle ID
编辑 `capacitor.config.json` 中的 `appId`：
```json
{
  "appId": "com.yourcompany.gamecenter"
}
```

### 修改应用名称
编辑 `capacitor.config.json` 中的 `appName`：
```json
{
  "appName": "游戏中心"
}
```

## 无 Mac 构建方案

如果没有 Mac，可以使用以下云服务构建：

### 方案 1: GitHub Actions + macOS Runner
创建 `.github/workflows/build-ios.yml` 使用 GitHub 的 macOS runner 构建

### 方案 2: Expo EAS Build
迁移到 Expo 并使用 EAS Build 服务

### 方案 3: Ionic Appflow
使用 Ionic 的云端构建服务
