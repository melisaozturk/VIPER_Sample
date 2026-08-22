# VIPER Sample

A small iOS sample project demonstrating the VIPER architecture pattern (View–Interactor–Presenter–Entity–Router) implemented in Swift. The project shows a clean separation of responsibilities, testable components, and a simple flow for fetching and displaying data.

## Features

- Example VIPER modules for a simple list + detail flow
- Network layer abstraction (URLSession)
- Basic dependency wiring using factory/assembler pattern
- Simple caching and image loading (via Kingfisher in the Podfile)
- Clear folder structure to separate concerns

## Architecture

VIPER splits responsibilities into five layers:

- View: Displays UI and forwards user actions to the Presenter.
- Interactor: Contains business logic and data fetching.
- Presenter: Prepares data for the View and handles presentation logic.
- Entity: Plain data models used by Interactor/Presenter.
- Router: Handles navigation and module wiring.

This sample demonstrates how to implement and connect these components for a simple, testable module.

## Requirements

- Xcode 12.0 or newer
- iOS 13.0+ (adjustable in project settings)
- Swift 5+

## Installation

This project uses CocoaPods for dependency management.

1. Install CocoaPods if you don't have it:

   sudo gem install cocoapods

2. Install project dependencies:

   pod install

3. Open the workspace:

   open VIPER_Sample.xcworkspace

4. Build and run the app on a simulator or device.

## How to use

- The app launches to a list screen. Tap an item to navigate to its detail screen.
- Inspect the project folder structure to see how VIPER components are grouped per module.

## Tests

Add unit tests for Presenters and Interactors to verify business logic and presentation behavior. The project is structured to make these components easy to unit-test.

## Contributing

Contributions and suggestions are welcome. Please open an issue to discuss larger changes before submitting a PR.

## License

This project is provided "as-is". Use and modify freely. Add a LICENSE file if you want to specify a license.

---

If you'd like, I can also:

- Add a LICENSE file (MIT, Apache-2.0, etc.).
- Create a CONTRIBUTING.md with contribution guidelines.
- Add sample screenshots to the README.
