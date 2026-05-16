# Bench

A macOS video editor with deep AI integration.

## Features (v1)

- Native macOS video editing with timeline
- AI-powered subtitle generation (Whisper)
- Smart trimming and scene detection
- Voice enhancement
- Local-first, all data stays on device

## Tech Stack

- **UI**: SwiftUI
- **Video**: AVFoundation / VideoToolbox
- **Storage**: SQLite (GRDB)
- **AI**: Bring your own API keys (Whisper, GPT/Claude)
- **Minimum**: macOS 14 (Sonoma)

## Development

```bash
# Open in Xcode
open Bench.xcodeproj

# Build
xcodebuild -project Bench.xcodeproj -scheme Bench build
```

## License

MIT
