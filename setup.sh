#!/bin/bash

echo "================================"
echo "游戏中心 iOS App 设置脚本"
echo "================================"
echo ""

# 检查 Node.js
if ! command -v node &> /dev/null; then
    echo "❌ Node.js 未安装"
    echo "请先安装 Node.js: https://nodejs.org"
    exit 1
fi

echo "✅ Node.js 版本: $(node -v)"

# 安装依赖
echo ""
echo "📦 安装 npm 依赖..."
npm install

# 添加 iOS 平台
echo ""
echo "📱 添加 iOS 平台..."
npx cap add ios

# 同步代码
echo ""
echo "🔄 同步 Web 代码到 iOS..."
npx cap sync

echo ""
echo "================================"
echo "✅ 设置完成！"
echo "================================"
echo ""
echo "下一步："
echo "1. 在 Xcode 中打开项目:"
echo "   npx cap open ios"
echo ""
echo "2. 或构建未签名 IPA:"
echo "   cd ios/App"
echo "   xcodebuild -workspace App.xcworkspace -scheme App -configuration Release -sdk iphoneos -destination generic/platform=iOS archive -archivePath build/App.xcarchive CODE_SIGNING_ALLOWED=NO"
echo ""
