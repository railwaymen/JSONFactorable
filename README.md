# JSONFactoryCore

[![build status](https://git.railwaymen.org/open/jsonfactorable/badges/develop/build.svg)](https://git.railwaymen.org/open/jsonfactorable/pipelines) [![Coverage report](https://git.railwaymen.org/open/jsonfactorable/badges/develop/coverage.svg)](https://git.railwaymen.org/open/jsonfactorable/commits/develop) [![Swift](https://img.shields.io/badge/Swift-5.1-green.svg?style=flat)](https://swift.org)

## Installation

1. Add pod to your Podfile:

  ```ruby
  pod 'JSONFactorable'
  ```

2. Install pods:

  ```bash
  bundle exec pod install
  ```

3. Import framework in your project:

  ```swift
  import JSONFactorable
  ```

4. Add extension to `JSONFactorable` which contains functions used by every factory like `buildObject(of:)` function.

### Gems

- [Cocoapods](https://cocoapods.org) 1.8.4
- [Fastlane](https://fastlane.tools) 2.137.0 ([README](fastlane/README.md))
- [Slather](https://github.com/SlatherOrg/slather) 2.4.7
- [xcode-install](https://github.com/xcpretty/xcode-install) 2.6.3
- [xcov](https://github.com/nakiostudio/xcov) 1.7.0

### CocoaPods

- [SwiftLint](https://cocoapods.org/pods/SwiftLint) 0.38.0 ([Rules](.swiftlint.yml))

## Contribution

### Requirements

- [Bundler](https://bundler.io) 1.16.5
- [Xcode](https://developer.apple.com/xcode/) 11.3 (11C29)

### Configuration

- `bundle install`
- `bundle exec pod install`
- Open `*.xcworkspace` in xcode

### Unit tests

- `bundle exec fastlane test`

### Release

Merge changes to `master`. And tag with proper version marked previously in podspec e.g. `1.0.1` Then manually deploy on GitLab
