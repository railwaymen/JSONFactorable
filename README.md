# JSONFactoryCore


[![Package Validation Status](https://github.com/railwaymen/JSONFactorable/workflows/Package%20Validation/badge.svg)](https://github.com/railwaymen/JSONFactorable/actions)
[![Coverage Status](https://coveralls.io/repos/github/railwaymen/JSONFactorable/badge.svg?branch=master)](https://coveralls.io/github/railwaymen/JSONFactorable?branch=master)

## Installation

### Swift Package Manager (recommended)

Add you dependency to the project. For more info about how to do that read [Apple's docs](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app)

### CocoaPods

1. Add pod to your Podfile:

  ```ruby
  pod 'JSONFactorable'
  ```

2. Install pods:

  ```bash
  pod install
  ```

## Usage

1. Import framework in your project:

  ```swift
  import JSONFactorable
  ```

2. Add extension to `JSONFactorable` which contains functions used by every factory like `buildObject(of:)` function.

3. Looking for more detailed examples of usage look into [Tests folder](./Tests/JSONFactorableTests)

### Merging example

To merge two (or more) objects representable by a dictionary (or an array) follow the example:

```swift
var jsonConvertible: AnyJSONConvertible = [
  "key": AnyJSONConvertible(someValue)
]
let mergedJSON = try jsonConvertible.merge(with: AnyJSONConvertible(someObject))
```

where someObject conforms to JSONObjectType protocol

## Contribution

Feel free to add your pull request or create an issue.

### Requirements

- [Xcode](https://developer.apple.com/xcode/) 11.3+
