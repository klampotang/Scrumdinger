# Scrumdinger

An iOS app for managing daily scrum meetings, built with SwiftUI. Based on Apple's [Scrumdinger tutorial](https://developer.apple.com/tutorials/app-dev-training).

## Features

- View a list of daily scrums with attendee count and meeting length
- Color-coded cards using 16 built-in themes
- In-meeting view with a progress indicator, elapsed/remaining time, and speaker navigation

## Project Structure

```
Scrumdinger/
├── Models/
│   ├── DailyScrum.swift       # Core data model
│   └── Theme.swift            # 16 color themes with accent colors
├── PreviewContent/
│   └── DailyScrum+Sample.swift  # Sample data for previews
├── CardView.swift             # List card for a single scrum
├── MeetingView.swift          # In-meeting timer screen
└── ScrumdingerApp.swift       # App entry point
```

## Requirements

- Xcode 15+
- iOS 17+
- Swift 5.9+

## Getting Started

1. Clone the repository
2. Open `Scrumdinger.xcodeproj` in Xcode
3. Select a simulator or device and press **Run** (⌘R)
