# Widgeteer

Widgeteer is a public SwiftUI iOS app (iOS 16+) with a WidgetKit extension that shares text using an App Group.

## Project Structure

- `Widgeteer/`
  - `WidgeteerApp.swift` (app entry point)
  - `ContentView.swift` (text entry + save via `@AppStorage` and App Group `UserDefaults`)
- `WidgeteerWidget/`
  - `WidgeteerWidget.swift` (widget reading shared App Group value)
- `Widgeteer.xcodeproj/`
  - App target: `Widgeteer`
  - Widget extension target: `WidgeteerWidget`

## App Group

This project uses the App Group:

- `group.Personal.Widgeteer`

It is referenced in both the app and widget code.

## Setup in Xcode

1. Open Xcode.
2. Clone this repository from GitHub:
   - **File → Clone Repository...**
   - URL: `https://github.com/MixwellDairy/Widgeteer.git`
3. Open `Widgeteer.xcodeproj`.
4. Select the project in the navigator, then set the app bundle identifier:
   - App target `Widgeteer` → **Signing & Capabilities**
   - Set Bundle Identifier to `Personal.Widgeteer`
5. Update widget bundle identifier (recommended):
   - Widget target `WidgeteerWidget` → **Signing & Capabilities**
   - Example: `Personal.Widgeteer.WidgeteerWidget`
6. Enable **App Groups** for both targets:
   - In app target `Widgeteer` → **Signing & Capabilities** → **+ Capability** → **App Groups**
   - In widget target `WidgeteerWidget` → **Signing & Capabilities** → **+ Capability** → **App Groups**
   - Add and select: `group.Personal.Widgeteer`
7. Choose your Team for signing on both targets.

## Run on iPhone 14 Pro Simulator (iOS 16+)

1. Select the `Widgeteer` scheme.
2. Select simulator: **iPhone 14 Pro**.
3. Build and run the app.

## Use the App + Widget

1. In the app, enter text in the **Widget Text** field.
2. Tap **Save**.
3. Go to the Home Screen and add the Widgeteer widget:
   - Long-press Home Screen → **+**
   - Search for **Widgeteer**
   - Add a supported size (`Small` or `Medium`)
4. The widget reads from the same App Group value and displays the saved text.

## Notes

- Minimum deployment target is iOS 16.
- No third-party dependencies are used.
- All source code and assets in this repository are public.
