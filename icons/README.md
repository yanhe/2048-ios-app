# 应用图标

需要为 iOS 应用提供以下尺寸的图标：

## iPad 图标
- 20pt: 20×20, 40×40 (@2x)
- 29pt: 29×29, 58×58 (@2x)
- 40pt: 40×40, 80×80 (@2x)
- 76pt: 76×76, 152×152 (@2x)
- 83.5pt: 167×167 (@2x)
- 1024pt: 1024×1024 (App Store)

## 生成图标工具

可以使用以下工具自动生成所有尺寸：

### 方案 1：在线工具
- https://appicon.co
- https://makeappicon.com

### 方案 2：使用 ImageMagick
```bash
# 安装 ImageMagick
brew install imagemagick

# 创建图标目录
mkdir -p AppIcon.iconset

# 生成各种尺寸
for size in 20 29 40 58 60 76 80 87 120 152 167 180 1024; do
    convert icon-1024.png -resize ${size}x${size} AppIcon.iconset/icon_${size}x${size}.png
    if [ $size -ne 1024 ]; then
        convert icon-1024.png -resize $((size*2))x$((size*2)) AppIcon.iconset/icon_${size}x${size}@2x.png
    fi
done

# 生成 .icns 文件
iconutil -c icns AppIcon.iconset
```

### 方案 3：使用 Figma/Sketch 插件
搜索 "iOS App Icon Template"

## 图标设计建议

1. **2048 游戏中心主题**
   - 建议使用简洁的卡片/数字风格
   - 参考颜色：
     - 2048 方块：#edc22e（金色）
     - 数独：#1976d2（蓝色）
     - 24点：#4caf50（绿色）

2. **示例设计**
   - 三张卡片堆叠效果
   - 中间大数字 "3"（代表三个游戏）
   - 渐变背景

## 放置位置

生成图标后，替换以下位置的图片：
```
ios/App/App/Assets.xcassets/AppIcon.appiconset/
```

## 启动图

启动图位于：
```
ios/App/App/Assets.xcassets/Splash.imageset/
```

建议尺寸：
- iPad Pro 12.9": 2048×2732
- iPad Pro 11": 1668×2388
- iPad Air: 1640×2360
- iPad mini: 1488×2266
