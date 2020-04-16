// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "JSONFactorable",
    platforms: [
        .iOS(.v11),
        .macOS(.v10_12)
    ],
    products: [
        .library(
            name: "JSONFactorable",
            targets: ["JSONFactorable"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "JSONFactorable",
            dependencies: []),
        .testTarget(
            name: "JSONFactorableTests",
            dependencies: ["JSONFactorable"])
    ]
)
