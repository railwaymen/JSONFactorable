# JSONFactoryCore


[![Package Validation Status](https://github.com/railwaymen/JSONFactorable/workflows/Package%20Validation/badge.svg)](https://github.com/railwaymen/JSONFactorable/actions)
[![Coverage Status](https://coveralls.io/repos/github/railwaymen/JSONFactorable/badge.svg?branch=master)](https://coveralls.io/github/railwaymen/JSONFactorable?branch=master)

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

### Merging example

To merge two (or more) objects represatable by a dictionary (or an array) follow the example:

```swift
var jsonConvertible: AnyJSONConvertible = [
  "key": AnyJSONConvertible(someValue)
]
let mergedJSON = try jsonConvertible.merge(with: AnyJSONConvertible(someObject))
```

where someObject conforms to JSONObjectType protocol

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

- [Bundler](https://bundler.io) 2.1.1
- [Xcode](https://developer.apple.com/xcode/) 11.3 (11C29)

### Configuration

- `bundle install`
- `bundle exec pod install`
- Open `*.xcworkspace` in xcode

### Unit tests

- `bundle exec fastlane test`

### Release

Merge changes to `master`. And tag with proper version marked previously in podspec e.g. `1.0.1` Then manually deploy on GitLab
