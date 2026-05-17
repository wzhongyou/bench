# Bench Technical Design

## 1. Positioning

A native macOS video editor with deep AI integration to speed up editing workflows.

**v1 Scope:**
- Mac only, no cross-platform
- Local-first, no cloud collaboration
- AI-assisted editing only, not a content creation pipeline

---

## 2. Architecture

### 2.1 Approach

**Client-only architecture.**

No server needed for v1. AI features call external APIs directly using the user's own keys. All data stays local.

| Aspect | Client-only | Client + Server |
|-------|------------|-----------------|
| Dev cost | Low | High |
| UX | Works offline | Requires network |
| Data safety | Fully local | Uploaded to cloud |
| AI calling | BYO Key | Server proxy |
| v1 fit | ✅ | ❌ Over-engineered |

### 2.2 Architecture Diagram

```
┌──────────────────────────────────────────┐
│              Bench (macOS)               │
├──────────────────────────────────────────┤
│  SwiftUI Layer                           │
│  ├── Timeline View                       │
│  ├── Preview Canvas                      │
│  ├── Inspector Panel                     │
│  └── AI Tools Panel                      │
├──────────────────────────────────────────┤
│  Core Layer (Swift)                      │
│  ├── Project Manager                     │
│  ├── Timeline Engine                     │
│  ├── Render Engine (AVFoundation)        │
│  ├── AI Service (API Client)             │
│  └── Media Manager                       │
├──────────────────────────────────────────┤
│  Platform                                 │
│  ├── AVFoundation / VideoToolbox         │
│  ├── Core ML (optional on-device ML)     │
│  └── SQLite (project data)               │
├──────────────────────────────────────────┤
│  External AI APIs (user-configured keys) │
│  ├── Whisper (speech-to-text)            │
│  ├── GPT / Claude (text processing)      │
│  └── Other AI services                   │
└──────────────────────────────────────────┘
```

---

## 3. Tech Stack

| Category | Technology | Notes |
|---------|-----------|-------|
| UI | SwiftUI | Native Mac, declarative |
| Video | AVFoundation | Apple native video framework |
| Codec | VideoToolbox | Hardware-accelerated encode/decode |
| Storage | SQLite (GRDB) | Project and media metadata |
| AI client | URLSession + Codable | Call external AI APIs |
| Build | Xcode + SPM | Standard toolchain |
| Minimum OS | macOS 14 (Sonoma) | Leverage latest SwiftUI |

---

## 4. AI Capabilities

### 4.1 v1 Features

| Feature | Model | Description |
|--------|-------|------------|
| Auto subtitles | Whisper API | Speech-to-text, generate SRT |
| Smart trim | GPT/Claude | Text-based clip suggestions |
| Voice enhance | Local model / API | Noise reduction, leveling |
| Scene detection | Local algorithm + AI | Auto scene splitting |

### 4.2 API Key Management

- Users configure API keys in Settings
- Keys stored encrypted in macOS Keychain
- Retrieved from Keychain at call time, never written to disk as plaintext

---

## 5. Project Structure

```
bench/
├── Bench.xcodeproj
├── Sources/
│   ├── App/                # App entry point
│   ├── UI/                 # SwiftUI views
│   │   ├── Timeline/       # Timeline UI
│   │   ├── Preview/        # Preview canvas
│   │   ├── Inspector/      # Property inspector
│   │   └── Settings/       # App settings
│   ├── Core/               # Core logic
│   │   ├── Project/        # Project management
│   │   ├── Timeline/       # Timeline engine
│   │   ├── Render/         # Render engine
│   │   └── Media/          # Media management
│   ├── AI/                 # AI services
│   │   ├── Whisper/        # Speech recognition
│   │   ├── LLM/            # LLM integration
│   │   └── Keychain/       # Key management
│   └── Util/               # Utilities
├── docs/
└── research/               # Research (gitignored)
```

---

## 6. Distribution

| Item | Plan |
|------|------|
| Channel | DMG download / Homebrew / App Store (future) |
| Updates | Sparkle auto-update |
| Signing | Apple Developer signing + notarization |

---

*Version: v2.0*
*Last updated: 2026-05-17*
