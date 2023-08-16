// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppIconGen",
    platforms: [.macOS(.v12)],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.2.3")
    ],
    targets: [
        .executableTarget(
            name: "AppIconGen",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                "SFIconKit",
                "IconKit",
            ]
        ),
        .target(
            name: "SFIconKit",
            dependencies: [
                "IconKit"
            ]
        ),
        .target(
            name: "IconKit"
        ),
        .testTarget(
            name: "SFIconKitTests",
            dependencies: ["SFIconKit"]),
    ]
)

