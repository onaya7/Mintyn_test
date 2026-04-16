# Mintyn iOS — Coding Test

A UIKit-based iOS application built as part of the Mintyn Bank iOS Developer recruitment process.

---

## Overview

This project recreates key screens from the Mintyn mobile app using **Swift** and **UIKit**, as specified in the technical assessment. The implementation covers:

- **Login Screen** — Mock authentication flow (no real API) that navigates the user to the Home tab on success
- **Home Tab** — Recreated from the Mintyn app reference
- **Settings Tab** — Functional implementation of System, Legal, and Logout options

---

## Task Requirements

| #   | Requirement                                 | Status |
| --- | ------------------------------------------- | ------ |
| 1   | Recreate Login screen with UIKit            | ✅     |
| 2   | Mock login (no API) → navigates to Home Tab | ✅     |
| 3   | Recreate Home Tab                           | ✅     |
| 4   | Recreate Settings Tab                       | ✅     |
| 5   | Settings: System option functionality       | ✅     |
| 6   | Settings: Legal option functionality        | ✅     |
| 7   | Settings: Logout option (returns to Login)  | ✅     |
| 8   | Unit Tests                                  | ✅     |
| 9   | UI Tests                                    | ✅     |

---

## Architecture

- **Pattern**: MVVM (Model-View-ViewModel) — ViewModels expose closure-based bindings; no Combine or RxSwift required
- **Navigation**: Programmatic `UITabBarController`, no storyboards
- **UI**: 100% code-based UIKit (no SwiftUI, no XIBs)
- **Theming**: Adaptive `UIColor` tokens via `UIColor.init(dynamicProvider:)` for automatic dark/light mode switching
- **Mock Auth**: Hardcoded credential validation; session state managed in-memory

---

## Project Structure

```
Mintyn/
├── AppDelegate.swift
├── SceneDelegate.swift
├── Modules/
│   ├── Welcome/
│   │   ├── WelcomeViewController.swift
│   │   └── WelcomeViewModel.swift
│   ├── Auth/
│   │   ├── LoginViewController.swift      (next)
│   │   └── LoginViewModel.swift           (next)
│   ├── Home/
│   │   └── HomeViewController.swift       (next)
│   └── Settings/
│       └── SettingsViewController.swift   (next)
├── Common/
│   ├── Extensions/
│   │   └── UIColor+Theme.swift
│   └── Components/
│       └── GradientButton.swift
└── Resources/
    └── Assets.xcassets/
        └── mintyn_logo (light + dark variants)
MintynTests/
└── (Unit Tests — added in later phase)
MintynUITests/
└── (UI Tests — added in later phase)
```

---

## Getting Started

### Prerequisites

- Xcode 15+
- iOS 16+ deployment target
- macOS Ventura or later

### Run the App

1. Clone the repository
2. Open `Mintyn.xcodeproj` in Xcode
3. Select a simulator (iPhone 15 recommended)
4. Press `Cmd + R` to build and run

### Run Tests

```bash
xcodebuild test -project Mintyn.xcodeproj -scheme Mintyn -destination 'platform=iOS Simulator,name=iPhone 15'
```

---

## Mock Login Credentials

| Field    | Value           |
| -------- | --------------- |
| Email    | user@mintyn.com |
| Password | password123     |

---

## Testing Strategy

- **Unit Tests**: Cover `LoginViewModel` validation logic, Settings actions, and business logic helpers
- **UI Tests**: Cover the login flow (valid/invalid credentials), tab navigation, and the Logout flow (returns to Login)

---

## Further Notes

See [SOLUTION.md](./SOLUTION.md) for a discussion of additional refactors, code organisation improvements, and enhancements that would be made given more time.

---

## Author

Submitted for Mintyn Bank iOS Developer Role — April 2026
