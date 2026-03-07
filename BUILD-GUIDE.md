# iOS App 构建指南

## 方案一：使用 GitHub Actions 自动构建（推荐，无需 Mac）

### 步骤

1. **将代码推送到 GitHub**
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git push origin main
   ```

2. **触发构建**
   - 访问 GitHub 仓库
   - 点击 Actions 标签
   - 选择 "Build iOS IPA"
   - 点击 "Run workflow"

3. **下载 IPA**
   - 等待构建完成（约 5-10 分钟）
   - 在 Artifacts 中下载 `GameCenter-unsigned-ipa`

4. **签名安装（需要 Apple ID）**

   由于 GitHub Actions 构建的是未签名版本，你需要使用以下工具之一签名：

   - **AltStore** (推荐，免费)：https://altstore.io
   - **Sideloadly**：https://sideloadly.io
   - **iOS App Signer** (Mac)：https://dantheman827.github.io/ios-app-signer/

   使用 AltStore 安装步骤：
   1. 在电脑上安装 AltServer
   2. 用数据线连接 iPad
   3. 在 AltStore 中导入下载的 IPA
   4. 点击安装

---

## 方案二：本地 Mac 构建

### 环境准备

1. **安装 Xcode**（Mac App Store）
2. **安装 Node.js**
   ```bash
   brew install node
   ```
3. **安装 CocoaPods**
   ```bash
   sudo gem install cocoapods
   ```

### 构建步骤

1. **进入项目目录**
   ```bash
   cd ios-app
   ```

2. **安装依赖**
   ```bash
   npm install
   ```

3. **添加 iOS 平台**
   ```bash
   npx cap add ios
   ```

4. **同步 Web 代码**
   ```bash
   npx cap sync
   ```

5. **打开 Xcode**
   ```bash
   npx cap open ios
   ```

6. **配置签名**
   - 在 Xcode 中选择项目
   - 选择 Targets → App
   - 在 Signing & Capabilities 中
   - 勾选 "Automatically manage signing"
   - 选择你的 Apple ID（免费的也可以）

7. **构建 IPA**
   - 选择 Product → Archive
   - 等待构建完成
   - 在 Organizer 中点击 "Distribute App"
   - 选择 "Ad Hoc" 或 "Development"
   - 导出 IPA

---

## 方案三：使用 Fastlane 自动化构建

### 安装 Fastlane

```bash
cd ios-app
bundle install
```

### 构建命令

```bash
# 构建未签名版本
bundle exec fastlane build_unsigned

# 构建 Ad Hoc 版本（需要证书）
bundle exec fastlane build_adhoc

# 构建 App Store 版本（需要证书）
bundle exec fastlane build_appstore
```

---

## 安装到 iPad

### 方法 1：Xcode 直接安装（开发者）
1. 连接 iPad 到 Mac
2. 在 Xcode 选择你的设备
3. 点击 Run 按钮

### 方法 2：AltStore（免费，推荐）
1. 安装 AltServer 到 Mac/Windows
2. 连接 iPad 到电脑
3. 安装 AltStore 到 iPad
4. 在 AltStore 中导入 IPA 安装

### 方法 3：Apple Configurator 2（Mac）
1. 在 Mac App Store 安装 Apple Configurator 2
2. 连接 iPad
3. 双击设备 → 点击 Add → Apps
4. 选择 "Choose from my Mac" 选择 IPA

### 方法 4：TestFlight（分发测试）
1. 注册 Apple Developer Program（$99/年）
2. 上传 IPA 到 App Store Connect
3. 使用 TestFlight 邀请测试

---

## 常见问题

### Q: 没有 Apple Developer 账号可以安装吗？
A: 可以，使用免费个人账号或 AltStore 侧载。但每 7 天需要重新签名。

### Q: 为什么 GitHub Actions 构建的是未签名版本？
A: 签名需要私钥和证书，为了安全不应上传到 GitHub。你可以在本地签名或使用 TestFlight。

### Q: 支持哪些 iOS 版本？
A: iOS 13.0 或更高版本

### Q: 可以上架 App Store 吗？
A: 可以，但需要 Apple Developer Program 账号（$99/年），并通过审核。

---

## 文件说明

- `src/index.html` - 游戏主文件（已针对 iPad 优化）
- `capacitor.config.json` - Capacitor 配置文件
- `ios/` - iOS 原生项目（运行 `npx cap add ios` 后生成）
- `.github/workflows/build-ios.yml` - GitHub Actions 自动构建配置

---

## 自定义配置

### 修改 Bundle ID
编辑 `capacitor.config.json`：
```json
{
  "appId": "com.yourcompany.gamecenter"
}
```

### 修改应用图标
替换 `ios/App/App/Assets.xcassets/AppIcon.appiconset/` 中的图标

### 修改启动图
替换 `ios/App/App/Assets.xcassets/Splash.imageset/` 中的图片
