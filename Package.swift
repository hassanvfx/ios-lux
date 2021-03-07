// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Lux",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .watchOS(.v6),
        .tvOS(.v13)
    ],
    products: [
        .library(
            name: "Lux",
            targets: ["Lux"]
        ),
    ],
    targets: [
        .target(
            name: "Lux",
            path: "Lux"
        ),
    ]
)
