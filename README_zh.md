# Bench

深度集成 AI 能力的 macOS 视频剪辑软件。

## 功能 (v1)

- 原生 macOS 视频时间线剪辑
- AI 自动字幕生成 (Whisper)
- 智能剪辑与场景检测
- 语音增强
- 数据完全本地存储

## 技术栈

- **UI**: SwiftUI
- **视频**: AVFoundation / VideoToolbox
- **存储**: SQLite (GRDB)
- **AI**: 用户自带 API Key (Whisper, GPT/Claude)
- **最低系统**: macOS 14 (Sonoma)

## 开发

```bash
# 打开 Xcode
open Bench.xcodeproj

# 构建
xcodebuild -project Bench.xcodeproj -scheme Bench build
```

## 协议

MIT
